#include "server_test.h"

server_test::server_test(QObject *parent)
    : QObject{parent}
{
    floor = "0";
    server = new QTcpServer(this);
    connect(server,SIGNAL(newConnection()),this,SLOT(newConnection()));

    if(!server->listen(QHostAddress::LocalHost,1234)){
        qDebug() << "Server could not start!";
    }
    else {
        qDebug() << "Server started";
    }
}

void server_test::newConnection(){
    socket = server->nextPendingConnection();

    connect(socket, SIGNAL(readyRead()), this, SLOT(receiveData()));

    socket->write("hello client \r\n");

    //socket->close();
}

void server_test::receiveData(){
    QByteArray buffer;
    buffer = socket->readAll();
    floor = QString(buffer);
    qDebug() << buffer << " : " << floor;
    emit newData(floor);
}

QString server_test::returnFloor(){
    return floor;
}

void server_test::dataFloor(QString value){
    floor = value;
}
