import zmq
from msgpack import unpackb, packb
import numpy as np
import cv2
import easyocr as e
import socket

TCP_IP = '127.0.0.1'
TCP_PORT = 1234

gaze_cur = (0,0)
reader = e.Reader(['en'],gpu=True) # need to run only once to load model into memorys

def opening(image):
    kernel = np.ones((5,5),np.uint8)
    return cv2.morphologyEx(image, cv2.MORPH_OPEN, kernel)

# get grayscale image
def get_grayscale(image):
    return cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

def check_gaze_on_object(gaze_point, boxes, labels):
    global IN_NUMBER_BOX, label_hold
    x_gaze,y_gaze = gaze_point

    for i in range(len(boxes)):
        xmin, ymin, xmax, ymax = boxes[i]

        if (x_gaze>xmin and x_gaze<xmax and y_gaze>ymin and y_gaze<ymax): #check if in the box of a number found
            label_hold = labels[i]
            return labels[i]
    return None

def check_near_prev_gaze(x,y,prev_gaze):
    x_p,y_p = prev_gaze
    if x_p == 0 or y_p == 0: return False
    if (abs(1-(x/x_p))<0.01) and (abs(1-(y/y_p))<0.01):
        return True
    else: return False

def getNumberBoxes(image):
    result = reader.readtext(image, allowlist="0123456789")
    #print(result)
    return_boxes = []
    return_labels = []

    for (bbox, text, prob) in result: 
        # unpack the bounding box
        if len(text) > 1: pass
        else:
            (tl, tr, br, bl) = bbox
            tl = (int(tl[0])-30, int(tl[1]-30))
            br = (int(br[0])+30, int(br[1]+30))
            return_boxes.append((tl[0],tl[1],br[0],br[1]))
            return_labels.append(text)
            cv2.rectangle(image, tl, br, (0, 255, 0), 2)
            cv2.putText(image, text, (tl[0], tl[1] - 10),
            cv2.FONT_HERSHEY_SIMPLEX, 0.8, (255, 0, 0), 2)

    return image, return_boxes, return_labels

context = zmq.Context()
# open a req port to talk to pupil
addr = "127.0.0.1"  # remote ip or localhost
req_port = "50020"  # same as in the pupil remote gui
req = context.socket(zmq.REQ)
req.connect("tcp://{}:{}".format(TCP_IP, req_port))
# ask for the sub port
req.send_string("SUB_PORT")
sub_port = req.recv_string()


# send notification:
def notify(notification):
    """Sends ``notification`` to Pupil Remote"""
    topic = "notify." + notification["subject"]
    payload = packb(notification, use_bin_type=True)
    req.send_string(topic, flags=zmq.SNDMORE)
    req.send(payload)
    return req.recv_string()


# open a sub port to listen to pupil
sub = context.socket(zmq.SUB)
sub.connect("tcp://{}:{}".format(TCP_IP, sub_port))

# set subscriptions to topics
# recv just pupil/gaze/notifications
sub.setsockopt_string(zmq.SUBSCRIBE, "frame.")
sub.setsockopt_string(zmq.SUBSCRIBE, 'gaze')


def recv_from_sub():
    """Recv a message with topic, payload.
    Topic is a utf-8 encoded string. Returned as unicode object.
    Payload is a msgpack serialized dict. Returned as a python dict.
    Any addional message frames will be added as a list
    in the payload dict with key: '__raw_data__' .
    """
    topic = sub.recv_string()
    payload = unpackb(sub.recv(), raw=False)
    extra_frames = []
    while sub.get(zmq.RCVMORE):
        extra_frames.append(sub.recv())
    if extra_frames:
        payload["__raw_data__"] = extra_frames
    return topic, payload


def has_new_data_available():
    # Returns True as long subscription socket has received data queued for processing
    return sub.get(zmq.EVENTS) & zmq.POLLIN

recent_world = None
x=0
y=0

FRAME_FORMAT = "bgr"

# Set the frame format via the Network API plugin
notify({"subject": "frame_publishing.set_format", "format": FRAME_FORMAT})

try:
    with socket.socket(socket.AF_INET,socket.SOCK_STREAM) as s:
        s.connect((TCP_IP,TCP_PORT))
        while True:
            # The subscription socket receives data in the background and queues it for
            # processing. Once the queue is full, it will stop receiving data until the
            # queue is being processed. In other words, the code for processing the queue
            # needs to be faster than the incoming data.
            # e.g. we are subscribed to scene (30 Hz) and eye images (2x 120 Hz), resulting
            # in 270 images per second. Displays typically only have a refresh rate of
            # 60 Hz. As a result, we cannot draw all frames even if the network was fast
            # enough to transfer them. To avoid that the processing can keep up, we only
            # display the most recently received images *after* the queue has been emptied.
            while has_new_data_available():
                topic, msg = recv_from_sub()

                if topic.startswith("gaze"):
                    gaze_coord = msg['norm_pos']
                    confidence = msg['confidence']
                    gaze_data = {'gaze_coord': gaze_coord, 'confidence': confidence}
                    x = int(gaze_coord[0]*1280)
                    y = int((1-gaze_coord[1])*720)
                    gaze_cur = (x,y)
                    #print(x,y)

                if topic.startswith("frame.") and msg["format"] != FRAME_FORMAT:
                    print(
                        f"different frame format ({msg['format']}); "
                        f"skipping frame from {topic}"
                    )
                    continue

                if topic == "frame.world":
                    recent_world = np.frombuffer(
                        msg["__raw_data__"][0], dtype=np.uint8
                    ).reshape(msg["height"], msg["width"], 3)

            if (recent_world is not None):

                #gray = get_grayscale(recent_world)
                #open = opening(gray)
                image_np, boxes, labels = getNumberBoxes(recent_world)
                recent_world = cv2.circle(recent_world, gaze_cur,radius=10, color=(0,0,255), thickness=-1)

                gaze_location = check_gaze_on_object(gaze_cur,boxes,labels)
                if gaze_location is not None: 
                    print('Gaze Location: ',gaze_location)
                if gaze_location is None:
                    gaze_location = " "

                s.send(str(gaze_location).encode('utf-8'))

                cv2.imshow("world", recent_world)
                cv2.waitKey(1)
except KeyboardInterrupt:
    pass
finally:
    cv2.destroyAllWindows()