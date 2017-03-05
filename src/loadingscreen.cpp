#include "loadingscreen.h"
#include "mainwindow.h"
#include "qtutilities.h"

LoadingScreen::LoadingScreen(QObject *parent) : QObject(parent)
{
    init();
}

void LoadingScreen::init()
{
    QObject *ui = MainWindow::getUi();
    loadingScreenProgressBar = ui->findChild<QObject*>("loadingScreenProgressBar");
    loadingScreenStatusLabel = ui->findChild<QObject*>("loadingScreenStatusLabel");
    loadingScreen = ui->findChild<QObject*>("loadingScreen");    
}

void LoadingScreen::setVisible(bool visible)
{
    QtUtilities::setVisible(loadingScreen, visible);
}

void LoadingScreen::setStatusText(const std::wstring& text)
{
    QtUtilities::setText(loadingScreenStatusLabel, text);
}





