import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: indicator
    height:50
    width:8
    Layout.minimumHeight: 50
    Layout.minimumWidth: 8
    Layout.maximumHeight: 50
    Layout.maximumWidth: 8
    property string indicatorColor:"white"
    Material.background:indicatorColor
}

