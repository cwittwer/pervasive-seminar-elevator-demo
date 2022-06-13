#ifndef SERVER_TEST_H
#define SERVER_TEST_H

#include <QObject>
#include <QDebug>
#include <QTcpServer>
#include <QTcpSocket>

class server_test : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString floorNum READ returnFloor WRITE dataFloor NOTIFY newData)
public:
    explicit server_test(QObject *parent = nullptr);
    QString returnFloor();
    void dataFloor(QString value);

signals:
    void newData(QString value);

public slots:
    void newConnection();
    void receiveData();

private:
    QTcpServer *server;
    QTcpSocket *socket;
    QString floor;

};

#endif // SERVER_TEST_H
