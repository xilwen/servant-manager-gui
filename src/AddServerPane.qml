import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: addDownloadServerPane
    width: 823
    height: 579
    padding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent

    BackButton{
        pageName: qsTr("安裝新伺服器")
        button.onClicked:{
            addDownloadServerPane.visible = false
        }
    }

    Label {
        id: serverTypeLabel
        width: 100
        height: 35
        text: "正要安裝："
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 75
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 15
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }

    Image {
        id: newServerTypeImage
        anchors.top: serverTypeLabel.bottom
        anchors.topMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 50
        source: "icon/ic_info_black_24dp.png"
    }

    Label {
        id: serverNameLabel
        width: 400
        height: 35
        text: "設定新伺服器的名稱(或留白以自動產生)："
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 190
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"

    }

    TextField {
        id: serverNameTextField
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.top: parent.top
        anchors.topMargin: 235
        font.pointSize: 15
        horizontalAlignment: Text.AlignLeft


    }

    BottomPane {
        id: bottomPane
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        AddServerModule_Button {
            id: customButton
            x: 572
            width: 180
            height: 48
            title: qsTr("自訂")
            addServerHintImage:"icon/ic_create_black_24dp.png"
            leftPadding: 36
            anchors.right: defaultButton.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                overviewPane_Empty.visible = false
                serverMallPane.visible = true
            }
        }
        AddServerModule_Button {
            id: defaultButton
            x: 572
            title: qsTr("快速設定")
            addServerHintImage:"icon/ic_fast_forward_black_24dp_2x.png"
            leftPadding: 36
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            onClicked: {
                overviewPane_Empty.visible = false
                serverMallPane.visible = true
            }
        }
    }

    Image {
        id: addServerHintImage
        y: 235
        width: 36
        height: 36
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.bottom: bottomPane.top
        anchors.bottomMargin: 20
        source: "icon/ic_info_black_24dp.png"
    }

    Label {
        id: serverTypeLabel1
        x: 1
        y: 2
        width: 121
        height: 35
        text: "新伺服器類型"
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 15
        horizontalAlignment: Text.AlignLeft
        anchors.top: serverTypeLabel.bottom
        anchors.left: newServerTypeImage.right
        anchors.topMargin: 22
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
    }

    Label {
        id: serverNameLabel1
        y: 5
        width: 629
        height: 35
        text: "在安裝完成後，您也可以使用 VirtualBox 針對虛擬機器進行進階設定。"
        anchors.left: addServerHintImage.right
        anchors.leftMargin: 10
        anchors.verticalCenter: addServerHintImage.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
    }

    Label {
        id: serverNameLabel2
        x: -6
        y: 4
        width: 400
        height: 35
        text: "與現有設定的相容性檢查會顯示在這裡。"
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 50
        horizontalAlignment: Text.AlignLeft
        anchors.top: serverNameTextField.bottom
        anchors.left: parent.left
        anchors.topMargin: 25
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
    }
}
