#ifndef FIRSTTIMESETUP_H
#define FIRSTTIMESETUP_H

#include <QObject>

class FirstTimeSetup : public QObject
{
    Q_OBJECT
public:
    explicit FirstTimeSetup(QObject *parent = 0);
    void setVisible(bool visible);
    static FirstTimeSetup *getInstance();
    virtual ~FirstTimeSetup();
signals:
    void readyToAssessHardware();
    void hardwareAssessmentFinished();
    void triggerFirstTimeIPUpdate();
public slots:
    void runHardwareAssessment();
    void showFinishedScreen();
    void firstTimeIPUpdate();
private:
    QObject *welcomePane;
    QObject *perfMeterPane;
    QObject *firstTimeFinishedPane;
    QObject *welcomeIPPane;
    static FirstTimeSetup *instance;
    void hardwareAssessmentRunner();
};

#endif // FIRSTTIMESETUP_H
