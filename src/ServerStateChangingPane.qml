import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: serverStateChangingPane
    width: 220
    height: 48
    z: 3
    objectName: "serverStateChangingPane"
    Material.elevation: 0
    Image {
        id: poweringimage
        width: 64
        height: 64
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        sourceSize.width: 0
        opacity: 1
        visible:false
        z: 3
        source: "icon/ic_power_settings_new_black_48dp.png"
    }

    BusyIndicator {
        id: serverStateChangingBusyIndicator
        width: 36
        height: 36
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
    }

    Label {
        id: serverStartingLabel
        text: "正在啟動..."
        visible: false
        anchors.verticalCenterOffset: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
    }

    Image {
        id: changingimage
        width: 36
        height: 36
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        visible: false
        sourceSize.width: 0
        opacity: 1
        z: 3
        source: "icon/ic_create_black_24dp.png"
    }

    Label {
        id: serverChangingLabel
        text: "請稍候..."
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


