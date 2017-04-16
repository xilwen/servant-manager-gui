import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: setting_RepositoryPane
    objectName: "setting_RepositoryPane"
    property alias repoUrl: textField.text
    width: 640
    height: 320
    z: 99
    padding: 0
    Material.elevation: 8
    onVisibleChanged: {
        if(visible == true){
            mask.visible = true
        } else{
            mask.visible = false
        }
    }

    BottomPane {
        id: bottomPane
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Button {
            id: applyButton
            x: 572
            width: 180
            height: 48
            text: qsTr("確定")
            leftPadding: 8
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 14
            anchors.rightMargin: 10
            Material.elevation: 0
            Material.background: "white"
            onClicked:{
                tmpCmd.triggerMallRepoUrlUpdate(repoUrl)
                setting_RepositoryPane.visible = false
            }
        }

        Button {
            id: cancelButton
            x: 581
            y: -9
            width: 180
            height: 48
            text: qsTr("取消")
            leftPadding: 8
            anchors.rightMargin: 10
            anchors.right: applyButton.left
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 14
            Material.elevation: 0
            font.family: "Microsoft JhengHei UI"
            Material.background: "white";
            onClicked: {
                setting_RepositoryPane.visible = false
            }
        }

        Button {
            id: cancelButton1
            x: 582
            y: -2
            width: 180
            height: 48
            text: qsTr("預設值")
            Material.background: "white"
            anchors.rightMargin: 10
            leftPadding: 8
            anchors.right: cancelButton.left
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 14
            Material.elevation: 0
            font.family: "Microsoft JhengHei UI"
            onClicked: {
                textField.text = "http://localhost/SERVANT/repo/"
            }
        }
    }

    Label {
        id: titleLabel
        y: -5
        width: 180
        height: 35
        text: "設定線上服務來源伺服器"
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 25
        horizontalAlignment: Text.AlignLeft
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: 25
        font.pointSize: 26
        font.family: "Microsoft JhengHei UI"

    }

    Label {
        id: descriptionLabel
        x: 8
        y: 0
        width: 585
        height: 35
        text: "SERVANT 的線上服務來源伺服器提供您探索並下載新的伺服器。除了使用預設的來源之外，也可以使用自行建立的服務來源伺服器，但請小心安全。"
        wrapMode: Text.WordWrap
        anchors.top: titleLabel.bottom
        horizontalAlignment: Text.AlignLeft
        anchors.left: parent.left
        verticalAlignment: Text.AlignTop
        font.pointSize: 15
        anchors.leftMargin: 25
        font.family: "Microsoft JhengHei UI"
        anchors.topMargin: 10
    }

    Image {
        id: addServerHintImage
        y: 235
        width: 36
        height: 36
        anchors.left: parent.left
        anchors.bottom: bottomPane.top
        anchors.bottomMargin: 10
        anchors.leftMargin: 25
        source: "icon/ic_info_black_24dp.png"

        Label {
            id: addServerHintLabel
            x: 46
            y: 0
            width: 400
            height: 35
            text: "確定變更後，將自動重新下載伺服器清單列表。"
            anchors.verticalCenter: addServerHintImage.verticalCenter
            horizontalAlignment: Text.AlignLeft
            anchors.left: addServerHintImage.right
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 15
            anchors.leftMargin: 10
            font.family: "Microsoft JhengHei UI"
        }
    }

    TextField {
        id: textField
        text: qsTr("Text Field")
        anchors.right: descriptionLabel.right
        anchors.rightMargin: 0
        anchors.left: descriptionLabel.left
        anchors.leftMargin: 0
        anchors.top: descriptionLabel.bottom
        anchors.topMargin: 50
        selectByMouse: true
        font.family: "Microsoft JhengHei UI"
    }
}
