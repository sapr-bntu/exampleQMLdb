// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "Core"   // подключаем модуль с кнопками


//для управления ипользовать стрелки вверх и вниз

Rectangle {
    width: 360
    height: 526
//    color:"#"

    //    выравнивание в один столбец
    Column
    {
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 10

        Text {
            id:txt
            text: qsTr("Hello World")
        }
        function dbInit() {
            var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);

            db.transaction(
                        function(tx) {
                            // Create the database if it doesn't already exist
                            tx.executeSql('CREATE TABLE IF NOT EXISTS [students] ([id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,'+
                                          '[firstname] VARCHAR(255)  NULL,'+
                                          '[lastname] VARCHAR(255)  NULL,'+
                                          '[middlename] VARCHAR(255)  NULL,'+
                                          '[group] VARCHAR(255)  NULL'+
                                          ');');

                            // Add (another) greeting row
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('32', 'Игорь', 'Авдей', 'Олегович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('33', 'Алексей', 'Анкип', 'Юрьевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('34', 'Дмитрий', 'Вашкевич', 'Иванович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('35', 'Сергей', 'Добродей', 'Гарриевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('36', 'Евгений', 'Завадский', 'Романович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('37', 'Александр', 'Казаковский', 'Владимирович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('38', 'Александр', 'Ковалевич', 'Николаевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('39', 'Андрей', 'Костелей', 'Александрович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('40', 'Анна', 'Кузнецова', 'Александровна', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('41', 'Дарья ', 'Минина', 'Дмитревна', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('42', 'Ярослав', 'Мещеряков', 'Олегович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('43', 'Сергей', 'Олиферко', 'Васильевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('44', 'Илья', 'Осиюк', 'Васильевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('45', 'Виктория', 'Павлова', 'Львовна', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('46', 'Ольга', 'Плышевская', 'Васильевна', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('47', 'Александр', 'Рубанов', 'Игоревич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('48', 'Алексей', 'Ругаин', 'Дмитревич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('49', 'Андрей', 'Савчук', 'Александрович', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('50', 'Дмитрий', 'Семашко', 'Валерьевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('51', 'Артем', 'Шибалко', 'Алексеевич', '107518');");
                            tx.executeSql("insert into students ('id', 'firstname', 'lastname', 'middlename', 'group') values ('52', 'Игорь', 'Якимуш', 'Степанович', '107518');");
                        }
                        )
        }
        function dbShow() {
            var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);

            db.transaction(
                        function(tx) {

                            // Show all added greetings
                            var rs = tx.executeSql('SELECT * FROM students');

                            var r = ""
                            for(var i = 0; i < rs.rows.length; i++) {
                                r += i+" "+rs.rows.item(i).firstname + ", " + rs.rows.item(i).middlename + ", " + rs.rows.item(i).lastname  + "\n"
                            }
                            txt.text = r
                        }
                        )
        }

        Button {
            id: buttonRun
            width:300
            text: "Инициализация"
            onClicked:  {
                console.log("run");
                parent.dbInit() ;

            }
        }
        Button{
            id: buttonList
            width:300
            text:"Отобразить"
            onClicked: {
                parent.dbShow()
            }
        }

        Button {
            id: buttonQuit
            width:300
            text: "Выход"
            onClicked:  {
                Qt.quit()
            }
        }



    //===========
    // Define a delegate component.  A component will be
    // instantiated for each visible item in the list.
    Component {
        id: petDelegate
        Item {
            id: wrapper
            width: 200; height: 55
            Column {
                Text { text: 'Имя: ' + firstname }
                Text { text: 'Отчество: ' + middlename }
                Text { text: 'Фамилия: ' + lastname }
            }
            // indent the item if it is the current item
            states: State {
                name: "Current"
                when: wrapper.ListView.isCurrentItem
                PropertyChanges { target: wrapper; x: 20 }
            }
            transitions: Transition {
                NumberAnimation { properties: "x"; duration: 200 }
            }
        }
    }

    // Define a highlight with customised movement between items.
    Component {
        id: highlightBar
        Rectangle {
            color: "lightsteelblue"; radius: 5
            width: 200; height: 50
            y: listView.currentItem.y;
            Behavior on y { SpringAnimation { spring: 2; damping: 0.1 } }
        }
    }

    ListView {
        id: listView
        width: 200;
        height:300

        model: ListModel {
            id: listModel
        }
        delegate: petDelegate
        focus: true

        // Set the highlight delegate. Note we must also set highlightFollowsCurrentItem
        // to false so the highlight delegate can control how the highlight is moved.
        highlight: highlightBar
        highlightFollowsCurrentItem: false

        Component.onCompleted: {
            var db = openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);

            db.transaction(
                        function(tx) {

                            // Show all added greetings
                            var rs = tx.executeSql('SELECT * FROM students');
                            for(var i = 0; i < rs.rows.length; i++) {
                                var data = {'firstname':rs.rows.item(i).firstname, 'middlename': rs.rows.item(i).middlename, 'lastname': rs.rows.item(i).lastname};
                                listModel.append(data)

                            }
                            listModel.sync()
                        }
                        )
        }
    }
    }
}
