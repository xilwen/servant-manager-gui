#ifndef MALL_H
#define MALL_H

#include <QObject>

class Mall : public QObject
{
    Q_OBJECT
public:
    explicit Mall(QObject *parent = 0);

signals:

public slots:
};

#endif // MALL_H