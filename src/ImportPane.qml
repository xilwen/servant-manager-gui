import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: importPane
    width: 600
    height: 600
    enabled: true
    padding: 0
    visible: true
    anchors.fill: parent
    Layout.fillWidth: true
    Layout.fillHeight: true

    Pane {
        id: banner
        height: 45
        rightPadding: 0
        bottomPadding: 0
        leftPadding: 0
        topPadding: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Material.background: Material.Green
        Material.foreground: "#ffffff"
        Material.elevation: 5

        Label {
            id: label
            text: qsTr(" 建立新伺服器")
            font.pointSize: 14
            font.family: "Microsoft JhengHei UI"
            anchors.left: button.right
            anchors.leftMargin: 0
            anchors.verticalCenter: parent.verticalCenter
        }

        Button {
            id: button
            width: 47
            height: 48
            text: qsTr("     ")
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.verticalCenter: parent.verticalCenter
            Material.elevation: 0
            Image{
                width: 24
                height: 24
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "./icons/ic_arrow_back_white_24dp_2x.png"
            }
            onClicked:{
                importPane.visible = false
                overviewPane.visible = true
            }
        }
    }

    Image {
        id: image
        width: 100
        height: 100
        anchors.top: parent.top
        anchors.topMargin: 68
        anchors.left: parent.left
        anchors.leftMargin: 24
        source: "icons/ic_storage_black_24dp_1x.png"
    }

    TextField {
        id: textField
        selectByMouse: true
        height: 50
        text: qsTr("FTPSvr")
        font.pointSize: 14
        font.family: "Microsoft JhengHei UI"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 135
        anchors.top: parent.top
        anchors.topMargin: 68
    }

    Button {
        id: button1
        x: 414
        y: 539
        width: 175
        height: 51
        text: qsTr("開始")
        font.pointSize: 14
        Material.background: Material.Green
        Material.foreground: "#ffffff"
        font.family: "Microsoft JhengHei UI"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
    }

    RadioButton {
        id: radioButton
        x: 24
        y: 188
        text: qsTr("全部公開讀取的FTP Server")
    }

    Label {
        id: label1
        text: qsTr("這樣將會建立一個任何人皆可查看資料(透過anonymous帳號)的伺服器。")
        anchors.left: radioButton.right
        anchors.leftMargin: -167
        anchors.top: radioButton.bottom
        anchors.topMargin: 6
    }

    Label {
        id: label2
        x: 135
        y: 119
        text: qsTr("基於 Ubuntu 16.04 LTS 和 ProFTPD 的 FTP 伺服器")
    }

    Label {
        id: label3
        x: 135
        y: 139
        text: qsTr("版本 0.1")
    }

    RadioButton {
        id: radioButton1
        x: 24
        y: 276
        text: qsTr("自訂存取權限")
    }

    Label {
        id: label4
        x: 24
        y: 360
        text: qsTr("資料將會存放在：")
    }

    TextField {
        id: textField1
        x: 24
        y: 380
        width: 377
        height: 40
        text: qsTr("")
    }

    Button {
        id: button2
        x: 415
        y: 375
        width: 175
        height: 51
        text: qsTr("瀏覽")
        anchors.verticalCenter: textField1.verticalCenter
        font.pointSize: 14
        font.family: "Microsoft JhengHei UI"
        Material.foreground: "#ffffff"
        Material.background: Material.Green
    }

    Label {
        id: label5
        x: 24
        y: 434
        text: qsTr("您可以透過這個資料夾存取和修改伺服器中的檔案。")
    }

}
