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

    Pane{
        id: generalCategoryPane
        height: 250
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: opBannerPane.bottom
        anchors.topMargin: 25
        Material.background: "#ffffff"
        Material.elevation: 5

        Label {
            id: serverlabel1
            width: 133
            height: 36
            text: qsTr("網路")
            anchors.top: parent.top
            font.pointSize: 22
            anchors.topMargin: 5
            font.family: "Microsoft JhengHei UI"
            anchors.left: parent.left
            anchors.leftMargin: 5
        }

        DiagnosisModule_Label {
            id: diagnosisModule_Label
            text: "常見伺服器連線測試"
            label2: "通過"
            anchors.top: serverlabel1.bottom
            anchors.topMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: serverlabel1.left
            anchors.leftMargin: 5
        }

        DiagnosisModule_Label {
            id: diagnosisModule_Label1
            text: "從WAN判斷本機IP (ipify.org)"
            label2: "0.0.0.0"
            anchors.top: diagnosisModule_Label.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: serverlabel1.left
            anchors.leftMargin: 5
        }

        DiagnosisModule_Label {
            id: diagnosisModule_Label2
            text: "本機設定的IP"
            label2: "0.0.0.0"
            anchors.top: diagnosisModule_Label1.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: serverlabel1.left
            anchors.leftMargin: 5
        }

        DiagnosisModule_Label {
            id: diagnosisModule_Label3
            text: "路由器/預設閘道IP"
            label2: "0.0.0.0"
            anchors.top: diagnosisModule_Label2.bottom
            anchors.topMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.left: serverlabel1.left
            anchors.leftMargin: 5
        }
    }


    ServerObjectButton{
        id:checksetbutton
        anchors.left: serverlabel.left
        anchors.leftMargin: 0
        anchors.top: serverlabel.bottom
        anchors.topMargin: 9
        serverTitle: qsTr("開啟路由器設定網頁")
        serverSubtitle: qsTr("檢查已建立的伺服器是否有異常設定")
        serverImageSource:"icon/ic_signal_cellular_connected_no_internet_4_bar_2x.png"
    }
    ServerObjectButton{
        id:backbutton
        anchors.top: checksetbutton.bottom
        anchors.topMargin: -84
        anchors.left: checksetbutton.right
        anchors.leftMargin: 36
        serverTitle: qsTr("測試WAN連線到伺服器")
        serverSubtitle: qsTr("開啟 WebSite Pulse 網站")
        serverImageSource:"icon/ic_schedule_2x.png"
    }

    Label {
        id: serverlabel
        y: 368
        width: 133
        height: 36
        text: qsTr("工具")
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: checkIntbutton.bottom
        anchors.topMargin: 9
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
    }







}
