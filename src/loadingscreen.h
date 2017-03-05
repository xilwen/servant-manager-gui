#ifndef LOADINGSCREEN_H
#define LOADINGSCREEN_H

#include <QObject>

class LoadingScreen : public QObject
{
    Q_OBJECT
public:
    explicit LoadingScreen(QObject *parent = 0);
    void init();
    void setVisible(bool visible);
    void setStatusText(const std::wstring& text);
signals:

public slots:

private:
    QObject *loadingScreen,
    *loadingScreenProgressBar,
    *loadingScreenStatusLabel;

};

#endif // LOADINGSCREEN_H
