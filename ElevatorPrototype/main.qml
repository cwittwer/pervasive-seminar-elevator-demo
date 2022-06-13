import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components 1.0
import QtQuick.Timeline 1.0
import QtQuick.Layouts 1.0
import com.server.test 1.0

//window containing the application
ApplicationWindow {

    visible: true

    //title of the application
    title: qsTr("Elevator Demo!")
    width: 1080
    height: 1920

    //menu containing two menu items
    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
        Menu {
            title: qsTr("Change Screen")
            MenuItem {
                text: qsTr("&Standard Arc Indicator")
                onTriggered: {
                    fCCC.opacity = 0
                    fCC.opacity = 0
                    eF.opacity = 0
                    eA.opacity = 1
                }

            }
            MenuItem {
                text: qsTr("&Standard Filling Indicator")
                onTriggered: {
                    fCCC.opacity = 0
                    fCC.opacity = 0
                    eF.opacity = 1
                    eA.opacity = 0
                }
            }
            MenuItem {
                text: qsTr("&Circle Filling Indicator")
                onTriggered: {
                    fCCC.opacity = 0
                    fCC.opacity = 1
                    eF.opacity = 0
                    eA.opacity = 0
                }
            }
            MenuItem {
                text: qsTr("&Circle Center Arc Indicator")
                onTriggered: {
                    fCCC.opacity = 1
                    fCC.opacity = 0
                    eF.opacity = 0
                    eA.opacity = 0
                }
            }
        }
    }

    TServer {
        id: server_stuff

        //onNewData: server_stuff.floorNum
    }

    FloorClusterCircle_central {
        id: fCCC
        opacity: 0

        floorTextScreenText: '0'

        property string selectingFloor: server_stuff.floorNum

        currentSelectionNumText: selectingFloor

        onSelectingFloorChanged: {
                reset1.start();
            if (selectingFloor === floorTextScreenText){
                floorIndicator.stop()
                reset1.start()
            }
            else if (server_stuff.floorNum == '0')
                floorIndicator.start()
            else if (server_stuff.floorNum == '1')
                floorIndicator.start()
            else if (server_stuff.floorNum == '2')
                floorIndicator.start()
            else if (server_stuff.floorNum == '3')
                floorIndicator.start()
            else if (server_stuff.floorNum == '4')
                floorIndicator.start()
            else if (server_stuff.floorNum == '5')
                floorIndicator.start()
            else if (server_stuff.floorNum == '6')
                floorIndicator.start()
            else if (server_stuff.floorNum == '7')
                floorIndicator.start()
            else if (server_stuff.floorNum == '8')
                floorIndicator.start()
        }

    }

    SequentialAnimation {
        id: floorIndicator
        NumberAnimation {target: fCCC;duration: 1500; property: "selectionIndicator"; to: 1000}
        PropertyAction {target: fCCC;property: "floorTextScreenText";value: server_stuff.floorNum}
        PropertyAction {target: fCCC;property: "selectionIndicator";value: -1}
    }
    SequentialAnimation {
        id: reset1
        PropertyAction {target: fCCC;property: "selectionIndicator";value: -1}
    }

    FloorClusterCircle {
        id: fCC
        opacity: 0

        floorTextScreenText: '0'

        property string selectingFloor: server_stuff.floorNum

        onSelectingFloorChanged: {
            floor0animation.stop(); floor1animation.stop(); floor2animation.stop(); floor3animation.stop(); floor4animation.stop();
            floor5animation.stop(); floor6animation.stop(); floor7animation.stop(); floor8animation.stop(); reset.start();
            if (selectingFloor === floorTextScreenText)
                reset.start()
            else if (server_stuff.floorNum == '0')
                floor0animation.start()
            else if (server_stuff.floorNum == '1')
                floor1animation.start()
            else if (server_stuff.floorNum == '2')
                floor2animation.start()
            else if (server_stuff.floorNum == '3')
                floor3animation.start()
            else if (server_stuff.floorNum == '4')
                floor4animation.start()
            else if (server_stuff.floorNum == '5')
                floor5animation.start()
            else if (server_stuff.floorNum == '6')
                floor6animation.start()
            else if (server_stuff.floorNum == '7')
                floor7animation.start()
            else if (server_stuff.floorNum == '8')
                floor8animation.start()
        }

        Component.onCompleted: floor0animation.stop()

        SequentialAnimation {
            id: floor0animation
            NumberAnimation {target: fCC;duration: 1500;property: "floor0IndicatorPosition";to: 1000}
            PropertyAction {target: fCC;property: "floor0IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor1animation
            NumberAnimation {target: fCC;duration: 1500;property: "floor1IndicatorPosition";to: 1000}
            PropertyAction {target: fCC;property: "floor1IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor2animation
            NumberAnimation {target: fCC;duration: 1500;property: "floor2IndicatorPosition";to: 1000}
            PropertyAction {target: fCC;property: "floor2IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor3animation
            NumberAnimation {target: fCC;duration: 1500;property: "floor3IndicatorPosition";to: 1000}
            PropertyAction {target: fCC;property: "floor3IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor4animation
            NumberAnimation {target: fCC;duration: 1500;property: "floor4IndicatorPosition";to: 1000}
            PropertyAction {target: fCC;property: "floor4IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor5animation
            NumberAnimation {target: fCC;duration: 1500;property: "floor5IndicatorPosition";to: 1000}
            PropertyAction {target: fCC;property: "floor5IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor6animation
            NumberAnimation {target: fCC;duration: 1500;property: "floor6IndicatorPosition";to: 1000}
            PropertyAction {target: fCC;property: "floor6IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor7animation
            NumberAnimation {target: fCC;duration: 1500;property: "floor7IndicatorPosition";to: 1000}
            PropertyAction {target: fCC;property: "floor7IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor8animation
            NumberAnimation {target: fCC; duration: 1500; property: "floor8IndicatorPosition"; to: 1000}
            PropertyAction {target: fCC;property: "floor8IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: reset
            PropertyAction {target: fCC;property: "floor0IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floor1IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floor2IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floor3IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floor4IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floor5IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floor6IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floor7IndicatorPosition";value: -1}
            PropertyAction {target: fCC;property: "floor8IndicatorPosition";value: -1}
        }
    }

    Elevator1_Fill {
        id: eF
        opacity: 1

        floorTextScreenText: '0'

        property string selectingFlooreF: server_stuff.floorNum

        onSelectingFlooreFChanged: {
            floor0animationeF.stop(); floor1animationeF.stop(); floor2animationeF.stop(); floor3animationeF.stop(); floor4animationeF.stop();
            floor5animationeF.stop(); floor6animationeF.stop(); floor7animationeF.stop(); floor8animationeF.stop(); reseteF.start();
            if (selectingFlooreF === floorTextScreenText)
                reseteF.start()
            else if (server_stuff.floorNum == '0')
                floor0animationeF.start()
            else if (server_stuff.floorNum == '1')
                floor1animationeF.start()
            else if (server_stuff.floorNum == '2')
                floor2animationeF.start()
            else if (server_stuff.floorNum == '3')
                floor3animationeF.start()
            else if (server_stuff.floorNum == '4')
                floor4animationeF.start()
            else if (server_stuff.floorNum == '5')
                floor5animationeF.start()
            else if (server_stuff.floorNum == '6')
                floor6animationeF.start()
            else if (server_stuff.floorNum == '7')
                floor7animationeF.start()
            else if (server_stuff.floorNum == '8')
                floor8animationeF.start()
        }

        Component.onCompleted: floor0animationeF.stop()

        SequentialAnimation {
            id: floor0animationeF
            NumberAnimation {target: eF;duration: 1500;property: "floor0IndicatorPosition";to: 1000}
            PropertyAction {target: eF;property: "floor0IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor1animationeF
            NumberAnimation {target: eF;duration: 1500;property: "floor1IndicatorPosition";to: 1000}
            PropertyAction {target: eF;property: "floor1IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor2animationeF
            NumberAnimation {target: eF;duration: 1500;property: "floor2IndicatorPosition";to: 1000}
            PropertyAction {target: eF;property: "floor2IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor3animationeF
            NumberAnimation {target: eF;duration: 1500;property: "floor3IndicatorPosition";to: 1000}
            PropertyAction {target: eF;property: "floor3IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor4animationeF
            NumberAnimation {target: eF;duration: 1500;property: "floor4IndicatorPosition";to: 1000}
            PropertyAction {target: eF;property: "floor4IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor5animationeF
            NumberAnimation {target: eF;duration: 1500;property: "floor5IndicatorPosition";to: 1000}
            PropertyAction {target: eF;property: "floor5IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor6animationeF
            NumberAnimation {target: eF;duration: 1500;property: "floor6IndicatorPosition";to: 1000}
            PropertyAction {target: eF;property: "floor6IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor7animationeF
            NumberAnimation {target: eF;duration: 1500;property: "floor7IndicatorPosition";to: 1000}
            PropertyAction {target: eF;property: "floor7IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor8animationeF
            NumberAnimation {target: eF; duration: 1500; property: "floor8IndicatorPosition"; to: 1000}
            PropertyAction {target: eF;property: "floor8IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: reseteF
            PropertyAction {target: eF;property: "floor0IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floor1IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floor2IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floor3IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floor4IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floor5IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floor6IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floor7IndicatorPosition";value: -1}
            PropertyAction {target: eF;property: "floor8IndicatorPosition";value: -1}
        }
    }

    Elevator1_Arc {
        id: eA
        opacity: 0

        floorTextScreenText: '0'

        property string selectingFlooreA: server_stuff.floorNum

        onSelectingFlooreAChanged: {
            floor0animationeA.stop(); floor1animationeA.stop(); floor2animationeA.stop(); floor3animationeA.stop(); floor4animationeA.stop();
            floor5animationeA.stop(); floor6animationeA.stop(); floor7animationeA.stop(); floor8animationeA.stop(); reseteA.start();
            if (selectingFlooreA === floorTextScreenText)
                reseteA.start()
            else if (server_stuff.floorNum == '0')
                floor0animationeA.start()
            else if (server_stuff.floorNum == '1')
                floor1animationeA.start()
            else if (server_stuff.floorNum == '2')
                floor2animationeA.start()
            else if (server_stuff.floorNum == '3')
                floor3animationeA.start()
            else if (server_stuff.floorNum == '4')
                floor4animationeA.start()
            else if (server_stuff.floorNum == '5')
                floor5animationeA.start()
            else if (server_stuff.floorNum == '6')
                floor6animationeA.start()
            else if (server_stuff.floorNum == '7')
                floor7animationeA.start()
            else if (server_stuff.floorNum == '8')
                floor8animationeA.start()
        }

        Component.onCompleted: floor0animationeA.stop()

        SequentialAnimation {
            id: floor0animationeA
            NumberAnimation {target: eA;duration: 1500;property: "floor0IndicatorPosition";to: 1000}
            PropertyAction {target: eA;property: "floor0IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor1animationeA
            NumberAnimation {target: eA;duration: 1500;property: "floor1IndicatorPosition";to: 1000}
            PropertyAction {target: eA;property: "floor1IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor2animationeA
            NumberAnimation {target: eA;duration: 1500;property: "floor2IndicatorPosition";to: 1000}
            PropertyAction {target: eA;property: "floor2IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor3animationeA
            NumberAnimation {target: eA;duration: 1500;property: "floor3IndicatorPosition";to: 1000}
            PropertyAction {target: eA;property: "floor3IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor4animationeA
            NumberAnimation {target: eA;duration: 1500;property: "floor4IndicatorPosition";to: 1000}
            PropertyAction {target: eA;property: "floor4IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor5animationeA
            NumberAnimation {target: eA;duration: 1500;property: "floor5IndicatorPosition";to: 1000}
            PropertyAction {target: eA;property: "floor5IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor6animationeA
            NumberAnimation {target: eA;duration: 1500;property: "floor6IndicatorPosition";to: 1000}
            PropertyAction {target: eA;property: "floor6IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor7animationeA
            NumberAnimation {target: eA;duration: 1500;property: "floor7IndicatorPosition";to: 1000}
            PropertyAction {target: eA;property: "floor7IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: floor8animationeA
            NumberAnimation {target: eA; duration: 1500; property: "floor8IndicatorPosition"; to: 1000}
            PropertyAction {target: eA;property: "floor8IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floorTextScreenText";value: server_stuff.floorNum}
        }
        SequentialAnimation {
            id: reseteA
            PropertyAction {target: eA;property: "floor0IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floor1IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floor2IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floor3IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floor4IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floor5IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floor6IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floor7IndicatorPosition";value: -1}
            PropertyAction {target: eA;property: "floor8IndicatorPosition";value: -1}
        }
    }


}
