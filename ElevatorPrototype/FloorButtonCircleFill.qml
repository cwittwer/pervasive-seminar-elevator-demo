import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Timeline 1.0

Item {
    width: 200
    height: 200
    property alias buttonText: floorNum.text
    property alias selectionIndicatorFill: timeline.currentFrame

    Rectangle {
        id: floorButton
        x: 0
        y: 0
        width: 200
        height: 200
        color: "#ffffff"
        radius: 100
        border.width: 1
        Text {
            id: floorNum
            text: qsTr("1")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 140
            font.family: "Roboto"
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Bold"
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                loops: 1
                running: false
                duration: 1000
                to: 1000
                from: 0
            }
        ]
        startFrame: 0
        endFrame: 1000
        enabled: true

        KeyframeGroup {
            target: floorButton
            property: "color"
            Keyframe {
                frame: 1000
                value: "#00ff18"
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}D{i:1}D{i:3}
}
##^##*/
