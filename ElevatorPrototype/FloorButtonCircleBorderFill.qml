import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Studio.Components 1.0
import QtQuick.Timeline 1.0

Item {
    width: 200
    height: 200
    property alias floorNum: text10.text
    property alias arcSelectionIndicator: timeline.currentFrame

    Rectangle {
        id: rectangle8
        x: 0
        y: 0
        width: 200
        height: 200
        color: "#ffffff"
        radius: 100
        border.width: 1
        Text {
            id: text10
            text: qsTr("2")
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 140
            font.family: "Roboto"
            anchors.horizontalCenter: parent.horizontalCenter
            font.styleName: "Bold"
        }

        ArcItem {
            id: arc
            x: 0
            y: 0
            width: 200
            height: 200
            end: 0
            strokeColor: "#00ff18"
            strokeWidth: 25
            fillColor: "#00000000"
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
            target: arc
            property: "end"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 1000
                value: 360
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;height:200;width:200}D{i:1}D{i:4}
}
##^##*/
