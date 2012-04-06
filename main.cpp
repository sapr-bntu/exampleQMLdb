#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"
#include <QtDeclarative/QDeclarativeContext>
#include <QDir>
#include <QDirModel>
#include <QSqlDatabase>
#include <QSqlTableModel>
#include <QSqlRecord>
#include <QDebug>
#include "msqltablemodel.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QSqlDatabase db;
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("qml/exampleQMLdb/stud.s3db");
    db.open();
    MSqlTableModel modelt;
      modelt.setTable("students");
      modelt.select();
//      modelt.removeColumn(0);
      qDebug()<<modelt.record(1).value(1);

    QmlApplicationViewer viewer;
    QDirModel model;
    viewer.rootContext()->setContextProperty("sqlModel", &modelt);
       viewer.rootContext()->setContextProperty("dirModel", &model);
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/exampleQMLdb/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
