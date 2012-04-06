// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "Core"   // подключаем модуль с кнопками


//для управления ипользовать стрелки вверх и вниз

Rectangle {
    width: 360
    height: 658
    //    выравнивание в один столбец
    Column
    {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10



        Button {
            id: buttonQuit
            width:300
            text: "Выход"
            onClicked:  {
                Qt.quit()
            }
        }


       ListView {
            id: view2
            width: 300
            height: 145

            model: VisualDataModel {
                model: sqlModel

                delegate: Rectangle {
                    width: 200; height: 25
                    Row{
                        Text { text: "text1 " +column1 +"  | "}
                        Text { text: "text2 "+ column2 +"  | "}
                        Text { text: "text3 " +column3 +"  | "}
                        Text { text: "text4 "+ column4}
                       }

                    }
                }
            }



}
}
