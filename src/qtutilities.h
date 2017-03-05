#ifndef QTUTILITIES_H
#define QTUTILITIES_H
#include <QObject>

class QtUtilities
{
public:
    QtUtilities() = delete;
    static void setVisible(QObject *object, const bool visible);
    static void setText(QObject *object, const std::wstring& text);
    static void setProgressBarIndeterminate(QObject *object, const bool indeterminate);
    static void setProgressBarValue(QObject *object, const double valueEqualOrBelowOne);
};

#endif // QTUTILITIES_H
