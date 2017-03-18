import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: serverStateChangingPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    objectName: "serverStateChangingPane"

    Button {
        id: backbutton
        height: 58
        visible: false
        anchors.top: parent.top
        anchors.topMargin: -18
        anchors.left: parent.left
        anchors.leftMargin: -12
        anchors.right: parent.right
        anchors.rightMargin: -12
        Material.background: "#424242"
        onClicked: {
            overviewPane.visible=false
            serverMallPane.visible=true
            serverProductInfoPane.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=false
        }

        Image {
            id: backimage
            y: 15
            width: 31
            height: 29
            anchors.left: parent.left
            anchors.leftMargin: 20
            source: "icon/ic_arrow_back_white_24dp_1x.png"
        }

        Text {
            id: ftptext
            y: 15
            width: 132
            height: 28
            text: qsTr("FTP伺服器")
            anchors.left: backimage.right
            anchors.leftMargin: 22
            verticalAlignment: Text.AlignVCenter
            font.family: "Microsoft JhengHei UI";
            font.pointSize: 16
            color: "white"
            objectName: "serverStartingText"
        }
    }

    Image {
        id: poweringimage
        width: 64
        height: 64
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        sourceSize.width: 0
        opacity: 1
        z: 3
        source: "icon/ic_power_settings_new_black_48dp.png"
    }

    BusyIndicator {
        id: serverStateChangingBusyIndicator
        width: 96
        height: 96
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Label {
        id: serverStartingLabel
        text: "正在啟動..."
        visible: false
        anchors.verticalCenterOffset: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
    }

    Image {
        id: changingimage
        width: 60
        height: 60
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false
        sourceSize.width: 0
        opacity: 1
        z: 3
        source: "icon/ic_create_black_24dp.png"
    }

    Label {
        id: serverChangingLabel
        text: "正在變更..."
        anchors.verticalCenterOffset: 100
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        visible: true
        font.pointSize: 15
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
    }
}


