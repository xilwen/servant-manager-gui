#include "qtutilities.h"
#include <QVariant>

void QtUtilities::setVisible(QObject *object, const bool visible)
{
    if(object)
    {
        object->setProperty("visible", QVariant(visible));
    }
}

void QtUtilities::setText(QObject *object, const std::wstring& text)
{
    if(object)
    {
        object->setProperty("text", QVariant(QString::fromStdWString(text)));
    }
}

void QtUtilities::setProgressBarIndeterminate(QObject *object, const bool indeterminate)
{
    if(object)
    {
        object->setProperty("indeterminate", QVariant(indeterminate));
    }
}

void QtUtilities::setProgressBarValue(QObject *object, const double valueEqualOrBelowOne)
{
    if(object)
    {
        object->setProperty("value", QVariant(valueEqualOrBelowOne));
    }
}
