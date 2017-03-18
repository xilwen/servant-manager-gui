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
    void readyToUpdateServerControlUI(const QString &machineName);
    void readyToDeleteServer(const QString &machineName);

public slots:
    void updateServerControlUI(const QString &machineName);
    void deleteServer(const QString &machineName);
private:
    static ServerControl *instance;
    QObject *serverInfoPane = nullptr;
    QObject *serverQuickControlPane_ON = nullptr;
    QObject *serverQuickControlPane_OFF = nullptr;
    QObject *serverInfoPane_button_ON = nullptr;
    QObject *serverInfoPane_button_OFF = nullptr;
};

#endif // SERVERCONTROL_H
