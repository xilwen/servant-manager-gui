#ifndef PERFERENCE_H
#define PERFERENCE_H

#include <QObject>
#include "ServantBase.hpp"

class Perference : public QObject
{
    Q_OBJECT
public:
    explicit Perference(QObject *parent = 0);
    virtual ~Perference();
    static Perference *getInstance();
signals:
    void readyToUpdateAboutData();
    void settingPaneUpdateTriggered();
public slots:
    void updateAboutData();
    void updateSettingPane();
private:
    QObject *aboutPane;
    QObject *settingPane;
    PerformanceManager *performanceManager;
    static Perference *instance;
};

#endif // PERFERENCE_H
