#ifndef DIAGNOSIS_H
#define DIAGNOSIS_H

#include <QObject>

class Diagnosis : public QObject
{
    Q_OBJECT
public:
    explicit Diagnosis(QObject *parent = 0);

signals:

public slots:
};

#endif // DIAGNOSIS_H