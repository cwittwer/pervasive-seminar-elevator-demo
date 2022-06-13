import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Timeline 1.0
import QtQuick.Studio.Components 1.0

Item {
    width: 900
    height: 900
    property alias arcStrokeColor: arc.strokeColor
    rotation: 0
    property alias floorNumRotation: floorNum.rotation
    property alias indictorPosition: timeline.currentFrame
    property alias floorNumText: floorNum.text

    ArcItem {
        id: arc
        width: 900
        height: 900
        end: 40
        strokeWidth: 200
        strokeColor: "#979797"
        fillColor: "#00000000"


        ArcItem {
            id: indicatorArc
            width: 900
            height: 900
            strokeWidth: -1
            begin: 0
            end: 10
            strokeColor: "#00ff01"
            fillColor: "#00000000"
        }

        Text {
            id: floorNum
            x: 528
            y: 31
            text: qsTr("0")
            font.pixelSize: 180
            rotation: 0
            font.styleName: "Bold"
            font.family: "Times New Roman"
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: false
                duration: 1000
                loops: 1
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: true

        KeyframeGroup {
            target: indicatorArc
            property: "strokeWidth"
            Keyframe {
                value: 200
                frame: 1000
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;height:900;width:900}D{i:4}
}
##^##*/
