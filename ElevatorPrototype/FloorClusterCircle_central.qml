import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Timeline 1.0
import QtQuick.Studio.Components 1.0

Item {
    width: parent.width
    height: parent.height
    property alias selectionIndicator: timeline.currentFrame
    property alias currentSelectionNumText: currentSelectionNum.text
    property alias floorTextScreenText: floorTextScreen.text

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "#ffffff"

        ArcItem {
            id: arc
            width: 400
            height: 400
            anchors.verticalCenter: floorButtonGroup.verticalCenter
            anchors.horizontalCenter: floorButtonGroup.horizontalCenter
            end: 0.00004
            strokeWidth: 85
            strokeColor: "#10ff00"
            fillColor: "#00000000"

            Text {
                id: currentSelectionNum
                x: 203
                y: 123
                anchors.verticalCenter: arc.verticalCenter
                anchors.horizontalCenter: arc.horizontalCenter
                text: qsTr("0")
                font.pixelSize: 150
                font.styleName: "Bold"
                font.family: "Verdana"
            }

            Text {
                id: currentText
                x: 140
                y: 260
                text: "Current"
                font.pixelSize: 32
                textFormat: Text.RichText
                font.family: "Verdana"
            }

            Text {
                id: selectionText
                x: 130
                y: 290
                text: "Selection"
                font.pixelSize: 32
                font.family: "Verdana"
                textFormat: Text.RichText
            }
        }

        Rectangle {
            id: rectangle1
            x: (rectangle.width * .5) - (rectangle1.width / 2)
            y: rectangle.height * .05
            width: 668
            height: 166
            color: "#1d1d1d"
            radius: 40
            border.width: 3
            Text {
                id: floorTextScreen
                x: 287
                y: -9
                color: "#00ff1f"
                text: qsTr("4")
                font.pixelSize: 150
                font.styleName: "Bold"
                font.family: "Verdana"
            }

            Text {
                id: text2
                x: 32
                y: 0
                color: "#ffffff"
                text: qsTr("Floor")
                font.letterSpacing: 2
                font.pixelSize: 45
                font.styleName: "Bold"
                font.family: "Verdana"
            }
        }

        GroupItem {
            id: floorButtonGroup
            x: 89
            y: rectangle1.y + (rectangle1.height * 2)

            FloorButtonArcFilling {
                id: floorButtonArcFilling
                x: 0
                y: 0
                arcStrokeColor: "#d2d2d2"
                indictorPosition: 0
                floorNumText: "0"
            }

            FloorButtonArcFilling {
                id: floorButtonArcFilling1
                x: 0
                y: 0
                arcStrokeColor: "#eeeeee"
                floorNumRotation: -40
                rotation: 40
                floorNumText: "1"
                indictorPosition: 0
            }

            FloorButtonArcFilling {
                id: floorButtonArcFilling2
                x: 0
                y: 0
                floorNumRotation: -80
                arcStrokeColor: "#b5b5b5"
                rotation: 80
                floorNumText: "2"
                indictorPosition: 0
            }

            FloorButtonArcFilling {
                id: floorButtonArcFilling3
                x: 0
                y: 0
                floorNumRotation: -120
                arcStrokeColor: "#d2d2d2"
                rotation: 120
                floorNumText: "3"
                indictorPosition: 0
            }

            FloorButtonArcFilling {
                id: floorButtonArcFilling4
                x: 0
                y: 0
                floorNumRotation: -160
                arcStrokeColor: "#eeeeee"
                rotation: 160
                floorNumText: "4"
                indictorPosition: 0
            }

            FloorButtonArcFilling {
                id: floorButtonArcFilling5
                x: 0
                y: 0
                floorNumRotation: -200
                arcStrokeColor: "#b5b5b5"
                rotation: 200
                floorNumText: "5"
                indictorPosition: 0
            }

            FloorButtonArcFilling {
                id: floorButtonArcFilling6
                x: 0
                y: 0
                arcStrokeColor: "#d2d2d2"
                floorNumRotation: -240
                rotation: 240
                floorNumText: "6"
                indictorPosition: 0
            }

            FloorButtonArcFilling {
                id: floorButtonArcFilling7
                x: 0
                y: 0
                floorNumRotation: -280
                arcStrokeColor: "#eeeeee"
                rotation: 280
                floorNumText: "7"
                indictorPosition: 0
            }

            FloorButtonArcFilling {
                id: floorButtonArcFilling8
                x: 0
                y: 0
                floorNumRotation: -320
                arcStrokeColor: "#b5b5b5"
                rotation: 320
                floorNumText: "8"
                indictorPosition: 0
            }
        }

        GroupItem {
            id: otherButtons
            x: 140
            y: 1619

            Rectangle {
                id: openButton
                x: 0
                y: 0
                width: 200
                height: 200
                color: "#ffffff"
                radius: 100
                border.width: 0
                GroupItem {
                    id: openIcon
                    width: 135
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenterOffset: 1
                    anchors.verticalCenterOffset: 1
                    anchors.horizontalCenter: parent.horizontalCenter
                    Image {
                        id: play6
                        x: 0
                        y: 0
                        width: 75
                        source: "images/play.png"
                        fillMode: Image.PreserveAspectFit
                        mirror: true
                    }

                    Image {
                        id: play7
                        x: 66
                        y: 0
                        width: 75
                        source: "images/play.png"
                        fillMode: Image.PreserveAspectFit
                        mirror: false
                    }
                }
            }

            Rectangle {
                id: alarmButton
                x: 300
                y: 0
                width: 200
                height: 200
                color: "#a68a0000"
                radius: 100
                border.width: 0
                Image {
                    id: exclamation
                    x: 25
                    y: -734
                    width: 150
                    height: 150
                    anchors.verticalCenter: parent.verticalCenter
                    source: "images/exclamation.png"
                    fillMode: Image.PreserveAspectFit
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            Rectangle {
                id: closeButton
                x: 600
                y: 0
                width: 200
                height: 200
                color: "#ffffff"
                radius: 100
                border.width: 0
                GroupItem {
                    id: closeIcon
                    width: 135
                    height: 75
                    anchors.verticalCenter: parent.verticalCenter
                    Image {
                        id: play4
                        x: 0
                        y: 0
                        width: 75
                        source: "images/play.png"
                        fillMode: Image.PreserveAspectFit
                    }

                    Image {
                        id: play5
                        x: 66
                        y: 0
                        width: 75
                        source: "images/play.png"
                        fillMode: Image.PreserveAspectFit
                        mirror: true
                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                duration: 1000
                running: false
                loops: 1
                to: 1000
                from: 0
            }
        ]
        enabled: true
        endFrame: 1000
        startFrame: 0

        KeyframeGroup {
            target: arc
            property: "end"
            Keyframe {
                value: 360
                frame: 1000
            }
        }
    }
}

