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
    property int performanceProfile: 0

    BackButton{
        showBackButton: false
        pageName: qsTr("安裝新伺服器 - 選擇效能需求")
        button.onClicked:{
            addDownloadServerPane.visible = false
        }
    }

    Image {
        id: newServerTypeImage
        anchors.top: parent.top
        anchors.topMargin: 65
        anchors.left: parent.left
        anchors.leftMargin: 50
        source: "icon/ic_info_black_24dp.png"
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
            id: defaultButton
            x: 572
            imageOnLeft: false
            title: qsTr("開始安裝")
            addServerHintImage:"icon/ic_skip_next_black_24dp_2x.png"
            leftPadding: 36
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            onClicked: {
                overviewPane_Empty.visible = false
                serverMallPane.visible = true
            }
        }

        AddServerModule_Button {
            id: defaultButton1
            x: 573
            y: -6
            leftPadding: 36
            anchors.rightMargin: 20
            anchors.right: defaultButton.left
            anchors.verticalCenter: parent.verticalCenter
            imageOnLeft: true
            title: qsTr(" 回到上一頁")
            addServerHintImage: "icon/ic_skip_previous_black_24dp_2x.png"
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
        id: serverTypeLabel
        x: 1
        y: 2
        width: 121
        height: 35
        text: "新伺服器類型"
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 15
        horizontalAlignment: Text.AlignLeft
        anchors.top: newServerTypeImage.bottom
        anchors.left: newServerTypeImage.right
        anchors.topMargin: -41
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
    }

    Label {
        id: addServerHintLabel
        y: 5
        width: 629
        height: 35
        text: "在安裝完成後，可以使用 VirtualBox 針對虛擬機器進行進階設定。"
        anchors.left: addServerHintImage.right
        anchors.leftMargin: 10
        anchors.verticalCenter: addServerHintImage.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
    }

    RadioButton {
        id: radioButton
        x: 50
        y: 162
        text: qsTr("設定檔1")
        checked: false
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
        onCheckedChanged:
        {
            if(checked == true)
            {
                performanceProfile = 0
            }
        }

        Label {
            id: profileHintLabel1
            width: 121
            height: 35
            text: " 設定檔1的說明"
            anchors.top: parent.bottom
            horizontalAlignment: Text.AlignLeft
            anchors.left: parent.left
            font.pointSize: 15
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 30
            font.family: "Microsoft JhengHei UI"
            anchors.topMargin: -15
        }
    }

    RadioButton {
        id: radioButton1
        x: 50
        y: 253
        text: qsTr("設定檔2")
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
        onCheckedChanged:
        {
            if(checked == true)
            {
                performanceProfile = 1
            }
        }

        Label {
            id: profileHintLabel2
            width: 121
            height: 35
            text: " 設定檔2的說明"
            anchors.top: parent.bottom
            horizontalAlignment: Text.AlignLeft
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 15
            anchors.leftMargin: 30
            font.family: "Microsoft JhengHei UI"
            anchors.topMargin: -15
        }
    }

    RadioButton {
        id: radioButton2
        x: 50
        y: 344
        text: qsTr("設定檔3")
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
        onCheckedChanged:
        {
            if(checked == true)
            {
                performanceProfile = 2
            }
        }

        Label {
            id: profileHintLabel3
            width: 121
            height: 35
            text: " 設定檔3的說明"
            anchors.top: parent.bottom
            horizontalAlignment: Text.AlignLeft
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 15
            anchors.leftMargin: 30
            font.family: "Microsoft JhengHei UI"
            anchors.topMargin: -15
        }
    }

    Label {
        id: actionHintLabel
        x: 50
        y: 121
        width: 121
        height: 35
        text: "請選擇適合使用情境的效能設定檔："
        anchors.top: newServerTypeImage.bottom
        horizontalAlignment: Text.AlignLeft
        anchors.left: newServerTypeImage.left
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 15
        anchors.leftMargin: 0
        font.family: "Microsoft JhengHei UI"
        anchors.topMargin: 10
    }
}
