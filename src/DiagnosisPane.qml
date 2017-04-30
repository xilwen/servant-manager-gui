import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: diagnosisPane
    width: 823
    height: 579
    leftPadding: 0
    rightPadding: 0
    bottomPadding: 0
    topPadding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    OpBannerPane{
        id: opBannerPane
        pageIcon: "icon/ic_build_white_48dp_2x.png"
        pageName: "診斷"
        haveDesciprtion: false
        backgroundColor: "#2196f3"
    }

    Label {
        id: servantlabel
        x: 23
        width: 133
        height: 36
        text: qsTr("SERVANT")
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: opBannerPane.bottom
        anchors.topMargin: 10
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 22
        font.family: "Microsoft JhengHei UI"
    }
    ServerObjectButton{
        id:recoderbutton
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: servantlabel.bottom
        anchors.topMargin: 9
        serverTitle: qsTr("記錄")
        serverSubtitle: qsTr("檢視 SERVANT 的記錄檔")
        serverImageSource:"icon/ic_reorder_black_24dp_2x.png"
    }
    ServerObjectButton{
        id:diagnosisbutton
        y: 56
        anchors.left: recoderbutton.right
        anchors.leftMargin: 36
        serverTitle: qsTr("自我診斷")
        serverSubtitle: qsTr("嘗試自我修復常見的問題")
        serverImageSource:"icon/ic_code_2x.png"
    }
    ServerObjectButton{
        id:checkIntbutton
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: intlabel.bottom
        anchors.topMargin: 9
        serverTitle: qsTr("檢查網路問題")
        serverSubtitle: qsTr("嘗試修復或提示常見的網路異常")
        serverImageSource:"icon/ic_visibility_2x.png"
    }
    ServerObjectButton{
        id:routerbutton
        y: 194
        height: 84
        anchors.left: checkIntbutton.right
        anchors.leftMargin: 36
        serverTitle: qsTr("路由器設定")
        serverSubtitle: qsTr("關於路由器調整的提示")
        serverImageSource:"icon/ic_help_outline_2x.png"
    }
    ServerObjectButton{
        id:checksetbutton
        anchors.left: parent.left
        anchors.leftMargin: 22
        anchors.top: serverlabel.bottom
        anchors.topMargin: 9
        serverTitle: qsTr("檢查設定")
        serverSubtitle: qsTr("檢查已建立的伺服器是否有異常設定")
        serverImageSource:"icon/ic_signal_cellular_connected_no_internet_4_bar_2x.png"
    }
    ServerObjectButton{
        id:backbutton
        y: 332
        anchors.left: checksetbutton.right
        anchors.leftMargin: 36
        serverTitle: qsTr("回到可用狀態")
        serverSubtitle: qsTr("將伺服器還原到特定的時間點")
        serverImageSource:"icon/ic_schedule_2x.png"
    }

    Label {
        id: intlabel
        y: 149
        width: 133
        height: 36
        text: qsTr("網路")
        anchors.left: parent.left
        anchors.leftMargin: 23
        anchors.topMargin: 9
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }

    Label {
        id: serverlabel
        y: 287
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
