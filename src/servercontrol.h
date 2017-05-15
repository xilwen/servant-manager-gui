#ifndef SERVERCONTROL_H
#define SERVERCONTROL_H

#include <QObject>

class ServerControl : public QObject
{
    Q_OBJECT
public:
    explicit ServerControl(QObject *parent = 0);
    static ServerControl *getInstance();

signals:
    void readyToUpdateServerControlUI(int itemIndex);
    void readyToDeleteServer(int itemIndex);

public slots:
    void updateServerControlUI(int itemIndex);
    void deleteServer(int itemIndex);
private:
    static ServerControl *instance;
    QObject *serverInfoPane = nullptr;
    QObject *serverQuickControlPane_ON = nullptr;
    QObject *serverQuickControlPane_OFF = nullptr;
    QObject *serverInfoPane_button_ON = nullptr;
    QObject *serverInfoPane_button_OFF = nullptr;
};

#endif // SERVERCONTROL_H
