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
public slots:
    void updateAboutData();
private:
    QObject *aboutPane;
    PerformanceManager *performanceManager;
    static Perference *instance;
};

#endif // PERFERENCE_H
