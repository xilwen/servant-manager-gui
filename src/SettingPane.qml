import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: settingPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    Label {
        id: settingtServertMalllabel
        width: 133
        height: 36
        text: qsTr("伺服器商城")
        anchors.left: parent.left
        anchors.leftMargin: 23
        anchors.top: parent.top
        anchors.topMargin: 11
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 22
        font.family: "Microsoft JhengHei UI";
    }
    ServerObjectButton{
        id: servantsitebutton
        serverTitle: qsTr("服務來源")
        serverSubtitle: qsTr("設定提供 SERVANT 服務的伺服器")
        serverImageSource:"icon/ic_shopping_basket_2x.png"
        anchors.top: settingtServertMalllabel.bottom
        anchors.topMargin: 9
        anchors.left: parent.left
        anchors.leftMargin: 22
        onClicked:{
            setting_RepositoryPane.visible = true
        }
    }


    Label {
        id: generallabel
        width: 133
        height: 36
        text: qsTr("一般")
        anchors.left: parent.left
        anchors.leftMargin: 23
        anchors.top: servantsitebutton.bottom
        anchors.topMargin: 9
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }
    ServerObjectButton{
        id: settingServantbutton
        serverTitle: qsTr("SERVANT設定")
        serverSubtitle: qsTr("")
        serverImageSource:"icon/ic_settings_2x.png"
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: generallabel.bottom
        anchors.topMargin: 9
    }
    ServerObjectButton{
        id: settingProgrambutton
        y: 194
        serverTitle: qsTr("設定關聯程式")
        serverSubtitle: qsTr("設定開啟連結或檔案用的外部程式")
        serverImageSource:"icon/ic_apps_2x.png"
        anchors.left: settingServantbutton.right
        anchors.leftMargin: 36
    }



    Label {
        id: networklabel
        width: 133
        height: 36
        text: qsTr("網路")
        anchors.left: parent.left
        anchors.leftMargin: 23
        anchors.top: settingServantbutton.bottom
        anchors.topMargin: 9
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
    }
    ServerObjectButton{
        id: settingconnectionbutton
        anchors.left: parent.left
        anchors.leftMargin: 22
        serverTitle: qsTr("連線設定")
        serverSubtitle: qsTr("設定連線到網際網路的方式")
        serverImageSource:"icon/ic_insert_link_2x.png"
        anchors.top: networklabel.bottom
        anchors.topMargin: 9
    }



}


