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
        anchors.leftMargin: 22
        anchors.top: parent.top
        anchors.topMargin: 11
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 22
        font.family: "Microsoft JhengHei UI";
    }

    Button {
        id: servantsitebutton
        width: 345
        height: 84
        anchors.top: settingtServertMalllabel.bottom
        anchors.topMargin: 9
        anchors.left: parent.left
        anchors.leftMargin: 22
        checkable: true
        Material.elevation: 8
        highlighted: true
        Material.background: "White"
        Image {
            id: servantsiteimage
            width: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.left: parent.left
            anchors.leftMargin: 10
            source: "icon/ic_shopping_basket_2x.png"
        }

        Label {
            id: servantsitelabel
            text: qsTr("SERVANT服務網址")
            anchors.top: parent.top
            anchors.topMargin: 21
            anchors.left: servantsiteimage.right
            anchors.leftMargin: 8
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
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

    Button {
        id: settingServantbutton
        width: 345
        height: 84
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: generallabel.bottom
        anchors.topMargin: 9
        Material.elevation: 8
        highlighted: true
        Material.background: "White"

        Image {
            id: settingServantimage
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            source: "icon/ic_settings_2x.png"
        }

        Label {
            id: settingServantlabel
            text: qsTr("SERVANT設定")
            anchors.left: settingServantimage.right
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 21
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }

    Button {
        id: settingProgrambutton
        y: 194
        width: 345
        height: 84
        anchors.left: settingServantbutton.right
        anchors.leftMargin: 36
        Material.elevation: 8
        highlighted: true
        Material.background: "White"

        Image {
            id: settingProgramimage
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            source: "icon/ic_apps_2x.png"
        }

        Label {
            id: settingProgramlabel
            width: 120
            height: 26
            text: qsTr("設定關聯程式")
            anchors.left: settingProgramimage.right
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 21
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
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

    Button {
        id: settingconnectionbutton
        x: 23
        width: 345
        height: 84

        anchors.top: networklabel.bottom
        anchors.topMargin: 9
        Material.elevation: 8
        highlighted: true
        Material.background: "White"

        Image {
            id: settingconnectionimage
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 13
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 29
            source: "icon/ic_insert_link_2x.png"
        }

        Label {
            id: settingconnectionlabel
            text: qsTr("連線設定")
            anchors.left: settingconnectionimage.right
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 21
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }


}


