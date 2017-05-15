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
    onVisibleChanged:
    {
        if(visible == true){
            tmpCmd.triggerIpify()
        }
    }

    OpBannerPane{
        id: opBannerPane
        pageIcon: "icon/ic_build_white_48dp_2x.png"
        pageName: "診斷"
        haveDesciprtion: false
        backgroundColor: "#2196f3"
    }

    Pane{
        id: generalCategoryPane
        height: 120
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
            text: qsTr("外部網路")
            anchors.top: parent.top
            font.pointSize: 22
            anchors.topMargin: 5
            font.family: "Microsoft JhengHei UI"
            anchors.left: parent.left
            anchors.leftMargin: 5
        }

        DiagnosisModule_Label {
            id: diagnosisModule_Label1
            objectName: "diagnosisPaneIpifyLabel"
            text: "本機對外 IP (ipify.org)"
            label2: "0.0.0.0"
            anchors.top: serverlabel1.bottom
            anchors.topMargin: 20
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
        serverTitle: qsTr("檢視連線資訊")
        serverSubtitle: qsTr("使用系統工具確認網路資訊")
        serverImageSource:"icon/ic_signal_cellular_connected_no_internet_4_bar_2x.png"
        onClicked:{
            tmpCmd.triggerNetworkInfo()
        }
    }
    ServerObjectButton{
        id:backbutton
        anchors.top: checksetbutton.bottom
        anchors.topMargin: -84
        anchors.left: checksetbutton.right
        anchors.leftMargin: 36
        serverTitle: qsTr("測試伺服器")
        serverSubtitle: qsTr("開啟 WebSite Pulse 網站")
        serverImageSource:"icon/ic_schedule_2x.png"
        onClicked:{
            tmpCmd.triggerWebsitePulse()
        }
    }

    Label {
        id: serverlabel
        width: 133
        height: 36
        text: qsTr("工具")
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: generalCategoryPane.bottom
        anchors.topMargin: 20
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 22
    }

    Image {
        id: addServerHintImage
        y: 235
        width: 36
        height: 36
        anchors.left: parent.left
        anchors.leftMargin: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 75
        source: "icon/ic_info_black_24dp.png"
    }

    Label {
        id: addServerHintLabel
        y: 5
        width: 629
        height: 35
        text: "通常可以在連線資訊中，找到目前連線的預設閘道(Gateway)資訊。將預設閘道的IP輸入瀏覽器網址列開啟，即可看到路由器的設定畫面。若您並沒有該路由器的權限或者該路由器並沒有網頁介面，請聯絡網路管理員或者相關負責人員。"
        wrapMode: Text.WordWrap
        anchors.left: addServerHintImage.right
        anchors.leftMargin: 10
        anchors.verticalCenter: addServerHintImage.verticalCenter
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pointSize: 15
        font.family: "Microsoft JhengHei UI"
    }
}
