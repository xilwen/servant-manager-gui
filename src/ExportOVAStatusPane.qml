import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: exportOVAStatusPane
    width: 250
    height: 64
    objectName: "exportOVAStatusPane"
    z: 98
    Material.elevation: 8
    onVisibleChanged: {
        if(visible){
            mask.visible = true
        } else{
            mask.visible = false
            errorHappenedPane.open("匯出", "匯出結束")
        }
    }

    property int precentage: 0

    BusyIndicator {
        id: serverStateChangingBusyIndicator
        width: 36
        height: 36
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
    }

    Label {
        id: serverChangingLabel
        text: "請稍候...(" + precentage + "%)"
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        visible: true
        font.pointSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
    }
}


