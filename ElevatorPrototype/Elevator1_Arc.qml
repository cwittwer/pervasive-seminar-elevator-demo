import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Timeline 1.0
import QtQuick.Layouts 1.0

Rectangle {
    id: rectangle1
    width: parent.width
    height: parent.height
    color: "#ffffff" //"#494949"
    border.color: "#ffffff"
    property alias floor8IndicatorPosition: floor8.arcSelectionIndicator
    property alias floor7IndicatorPosition: floor7.arcSelectionIndicator
    property alias floor6IndicatorPosition: floor6.arcSelectionIndicator
    property alias floor5IndicatorPosition: floor5.arcSelectionIndicator
    property alias floor4IndicatorPosition: floor4.arcSelectionIndicator
    property alias floor3IndicatorPosition: floor3.arcSelectionIndicator
    property alias floor2IndicatorPosition: floor2.arcSelectionIndicator
    property alias floor1IndicatorPosition: floor1.arcSelectionIndicator
    property alias floor0IndicatorPosition: floor0.arcSelectionIndicator
    property alias floorTextScreenText: floorTextScreen.text

    Rectangle {
        id: rectangle
        x: (rectangle1.width * .5) - (rectangle.width / 2)
        y: rectangle1.height * .05
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
            font.family: "Verdana"
            font.styleName: "Bold"
        }

        Text {
            id: text2
            x: 32
            y: 0
            color: "#ffffff"
            text: qsTr("Floor")
            font.letterSpacing: 2
            font.pixelSize: 45
            font.family: "Verdana"
            font.styleName: "Bold"
        }
    }

    GroupItem {
        id: floorButtonGroup
        x: (rectangle1.width * .5) - (floorButtonGroup.width / 2)
        y: rectangle.y + (rectangle.height * 2)
        scale: 1

        FloorButtonCircleBorderFill {
            id: floor0
            x: 0
            y: 600
            floorNum: "0"
        }

        FloorButtonCircleBorderFill {
            id: floor1
            x: 300
            y: 600
            floorNum: "1"
        }

        FloorButtonCircleBorderFill {
            id: floor2
            x: 600
            y: 600
            floorNum: "2"
        }

        FloorButtonCircleBorderFill {
            id: floor3
            x: 0
            y: 300
            floorNum: "3"
        }

        FloorButtonCircleBorderFill {
            id: floor4
            x: 300
            y: 300
            floorNum: "4"
        }

        FloorButtonCircleBorderFill {
            id: floor5
            x: 600
            y: 300
            floorNum: "5"
        }

        FloorButtonCircleBorderFill {
            id: floor6
            x: 0
            y: 0
            floorNum: "6"
        }

        FloorButtonCircleBorderFill {
            id: floor7
            x: 300
            y: 0
            floorNum: "7"
        }

        FloorButtonCircleBorderFill {
            id: floor8
            x: 600
            y: 0
            floorNum: "8"
        }
    }

    GroupItem {
        id: otherButtons
        x: (rectangle1.width * .5) - (otherButtons.width / 2)
        y: floorButtonGroup.y + (floorButtonGroup.height * 1.3)

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
                anchors.verticalCenterOffset: 1
                anchors.horizontalCenterOffset: 1
                anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    id: play6
                    x: 0
                    y: 0
                    width: 75
                    source: "images/play.png"
                    mirror: true
                    fillMode: Image.PreserveAspectFit
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
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
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
                anchors.horizontalCenter: parent.horizontalCenter

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
                    mirror: true
                    fillMode: Image.PreserveAspectFit
                }
            }
        }
    }
}

