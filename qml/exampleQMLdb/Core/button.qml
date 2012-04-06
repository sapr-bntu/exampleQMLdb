import QtQuick 1.0


//Rectangle {
//    property alias text: textElement.text // свойство ссылка, для обращения на верхнем уровне
//    property string rsGradientStop0: "#FF7C7C7C" // свойство для хранения цвета
//    property string rsGradientStop1: "#FF4E4E4E"
//    id: button

//    signal clicked

//    width: 85
//    height: 23
//    border.color: "Wheat"
//    gradient: Gradient { // добавление градиента
//        GradientStop {
//            id: gradientStop0
//            position: 0
//            color: rsGradientStop0
//        }
//        GradientStop {
//            id: gradientStop1
//            position: 1
//            color: rsGradientStop1
//        }
//    }

//        Text {
//            id: textElement
//            color: "Wheat"
//            text: qsTr("Ok")
//            font.underline: false
//            font.bold: false
//            font.pixelSize: 12
//            anchors.centerIn: parent
//        }
//        ParallelAnimation {
//            id: mouseEnterAnim
//            PropertyAnimation {
//                target: gradientStop0
//                properties: "color"
//                to: rsGradientStop1
//                duration: 300
//            }
//            PropertyAnimation {
//                target: gradientStop1
//                properties: "color"
//                to: rsGradientStop0
//                duration: 300
//            }
//        }
//        ParallelAnimation {
//            id: mouseExitAnim
//            PropertyAnimation {
//                target: gradientStop0
//                properties: "color"
//                to: rsGradientStop0
//                duration: 300
//            }

//            PropertyAnimation {
//                target: gradientStop1
//                properties: "color"
//                to: rsGradientStop1
//                duration: 300
//            }
//        }
//        MouseArea {
//            id: mouse
//            anchors.fill: button
//            hoverEnabled: true
//            onEntered: mouseEnterAnim.start()
//            onExited: mouseExitAnim.start()
//            onClicked: {
//    //            doOp(operation)
//                button.clicked()
//        }
//        }

//}

Rectangle {
    id: button

    property alias text: textItem.text
    property alias font: textItem.font

    signal clicked

    width: textItem.width + 40; height: textItem.height + 10
    border.width: 1
    radius: height/6
    smooth: true


        gradient: Gradient {
            GradientStop {id: topGrad; position: 0.0; color: "darkGray" }
            GradientStop { position: 0.5; color: "black" }
            GradientStop { id: bottomGrad;  position: 1.0; color: "darkGray" }
        }
//    gradient: Gradient {
//        GradientStop { id: topGrad; position: 0.0; color: "black" }
//        GradientStop { id: bottomGrad; position: 1.0; color: "darkGray" }
//    }

    Text {
        id: textItem
        x: parent.width/2 - width/2; y: parent.height/2 - height/2
        font.pixelSize: 18
        color: "white"
        style: Text.Raised
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: button.clicked()
    }

    states: State {
        name: "pressed"; when: mouseArea.pressed && mouseArea.containsMouse
        PropertyChanges { target: topGrad; color: "black" }
        PropertyChanges { target: bottomGrad; color: "black" }
        PropertyChanges { target: textItem; x: textItem.x + 1; y: textItem.y + 1; explicit: true }
    }
}
//Rectangle {
//    id:button
//    property alias text: textItem.text

//    signal clicked

//    width: 150; height: 30
//    border.width: 1
//    radius: 5
//    smooth: true

//    gradient: Gradient {
//        GradientStop { position: 0.0; color: "darkGray" }
//        GradientStop { position: 0.5; color: "black" }
//        GradientStop { position: 1.0; color: "darkGray" }
//    }

//    Text {
//        id: textItem
//        anchors.centerIn: parent
//        font.pointSize: 20
//        color: "white"
//    }
//    MouseArea {
//        id: mouseArea
//        anchors.fill: parent
//        onClicked: {
////            doOp(operation)
//            button.clicked()
//    }
//    }
//}

