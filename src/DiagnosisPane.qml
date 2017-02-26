import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: diagnosisPane
    width: 823
    height: 579
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    Label {
        id: servantlabel
        width: 133
        height: 36
        text: qsTr("SERVANT")
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: parent.top
        anchors.topMargin: 11
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 22
        font.family: "Microsoft JhengHei UI"
    }

    Button {
        id: recordingbutton
        width: 345
        height: 84
        anchors.top: servantlabel.bottom
        anchors.topMargin: 9
        anchors.left: parent.left
        anchors.leftMargin: 22
        checkable: true
        Material.elevation: 8
        highlighted: true
        Material.background: "White"
        Image {
            id: recordingimage
            width: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.left: parent.left
            anchors.leftMargin: 10
            source: "icon/ic_reorder_black_24dp_2x.png"
        }

        Label {
            id: label1
            text: qsTr("記錄")
            anchors.top: parent.top
            anchors.topMargin: 21
            anchors.left: recordingimage.right
            anchors.leftMargin: 8
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
        }


    }

    Button {
        id: diagonsisbutton
        y: 56
        width: 345
        height: 84
        anchors.left: recordingbutton.right
        anchors.leftMargin: 36
        Material.elevation: 8
        highlighted: true
        Material.background: "White"

        Image {
            id: diagonsisimage
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 21
            anchors.top: parent.top
            anchors.topMargin: 13
            source: "icon/ic_code_2x.png"
        }

        Label {
            id: diagonsislabel
            text: qsTr("自我診斷")
            anchors.top: parent.top
            anchors.topMargin: 21
            anchors.left: diagonsisimage.right
            anchors.leftMargin: 8
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
        }
    }

    Label {
        id: intlabel
        width: 133
        height: 36
        text: qsTr("網路")
        anchors.left: parent.left
        anchors.leftMargin: 23
        anchors.top: recordingbutton.bottom
        anchors.topMargin: 9
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }

    Button {
        id: checkIntbutton
        width: 345
        height: 84
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: intlabel.bottom
        anchors.topMargin: 9
        Material.elevation: 8
        highlighted: true
        Material.background: "White"

        Image {
            id: checkIntimage
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 16
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 18
            source: "icon/ic_visibility_2x.png"
        }

        Label {
            id: checkIntlabel
            text: qsTr("檢查網路問題")
            anchors.left: checkIntimage.right
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
        id: routerbutton
        y: 194
        width: 345
        height: 84
        anchors.left: checkIntbutton.right
        anchors.leftMargin: 36
        Material.elevation: 8
        highlighted: true
        Material.background: "White"

        Image {
            id: routerimage
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            source: "icon/ic_help_outline_2x.png"
        }

        Label {
            id: routerlabel
            width: 120
            height: 26
            text: qsTr("路由器設定")
            anchors.left: routerimage.right
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 21
            font.family: qsTr("Microsoft JhengHei UI")
            font.pointSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }

    Label {
        id: serverlabel
        width: 133
        height: 36
        text: qsTr("伺服器")
        anchors.left: parent.left
        anchors.leftMargin: 23
        anchors.top: checkIntbutton.bottom
        anchors.topMargin: 9
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
    }

    Button {
        id: checkSettingbutton
        x: 23
        width: 345
        height: 84

        anchors.top: serverlabel.bottom
        anchors.topMargin: 9
        Material.elevation: 8
        highlighted: true
        Material.background: "White"

        Image {
            id: checkSettingimage
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            source: "icon/ic_signal_cellular_connected_no_internet_4_bar_2x.png"
        }

        Label {
            id: checkSettinglabel
            text: qsTr("檢查設定")
            anchors.left: checkSettingimage.right
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
        id: backStatuebutton
        y: 332
        width: 345
        height: 84
        Material.elevation: 8
        highlighted: true
        Material.background: "White"
        anchors.left: checkSettingbutton.right
        anchors.leftMargin: 36

        Image {
            id: backStatueimage
            width: 50
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 17
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 17
            source: "icon/ic_schedule_2x.png"
        }

        Label {
            id: backStatuelabel
            text: qsTr("回到可用狀態")
            anchors.left: backStatueimage.right
            anchors.leftMargin: 8
            anchors.top: parent.top
            anchors.topMargin: 21
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }
    }
    Pane {
        id: pane
        width: 823
        anchors.right: parent.right
        anchors.rightMargin: -12
        anchors.left: parent.left
        anchors.leftMargin: -12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: -12
        anchors.top: parent.top
        anchors.topMargin: -12
        //visible:true
        visible:false
        Image {
            id: loadingimage
            x: 367
            width: 65
            height: 65
            anchors.top: parent.top
            anchors.topMargin: 150
            source: "icon/ic_location_searching_2x.png"
        }

        ProgressBar {
            id: progressBar
            x: 271
            width: 256
            height: 16
            anchors.top: loadingimage.bottom
            anchors.topMargin: 3
            value: 0.5
            indeterminate: true
            Material.accent:"#2196F3"
        }

        Label {
            id: label
            x: 327
            width: 152
            height: 28
            text: qsTr("正在尋找問題.....")
            anchors.top: progressBar.bottom
            anchors.topMargin: 0
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 16
        }
    }







}
