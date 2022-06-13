import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Timeline 1.0
import QtQuick.Studio.Components 1.0

Item {
    width: parent.width
    height: parent.height
    property alias floor8IndicatorPosition: floorButtonArcFilling8.indictorPosition
    property alias floor3IndicatorPosition: floorButtonArcFilling3.indictorPosition
    property alias floor4IndicatorPosition: floorButtonArcFilling4.indictorPosition
    property alias floor0IndicatorPosition: floorButtonArcFilling.indictorPosition
    property alias floor5IndicatorPosition: floorButtonArcFilling5.indictorPosition
    property alias floor2IndicatorPosition: floorButtonArcFilling2.indictorPosition
    property alias floor1IndicatorPosition: floorButtonArcFilling1.indictorPosition
    property alias floor6IndicatorPosition: floorButtonArcFilling6.indictorPosition
    property alias floor7IndicatorPosition: floorButtonArcFilling7.indictorPosition
    property alias floorTextScreenText: floorTextScreen.text

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: parent.width
        height: parent.height
        color: "#ffffff"//"#d9d9d9"

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
            id: otherButtons
            x: (rectangle.width * .5) - (otherButtons.width / 2)
            y: floorButtonGroup.y + (floorButtonGroup.height * 1.25)

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

        GroupItem {
            id: floorButtonGroup
            x: (rectangle.width * .5) - (floorButtonGroup.width / 2)
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
                arcStrokeColor: "#d2d2d2"
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
    }
}
