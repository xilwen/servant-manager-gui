import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id:serverProductInfoPane
    objectName:"serverProductInfoPane"
    width: 823
    height: 579
    padding: 0

    property alias progressBarValue : progressBar.value
    property alias progressText : label7.text
    property alias succeedPaneVisible : downloadSucceedPane.visible
    //Informations should be set/read from Model(Data)
    property int itemIndex: 0 //index in model array
    property string itemName : "伺服器名稱"
    property string itemDescription : "伺服器簡述"
    property string itemProducer : "伺服器製作者"
    property string itemIcon : ""
    property string itemUpdateDate : "更新日期"
    property string itemOperatingSystem : "伺服器作業系統"
    property string itemManagementUI : "伺服器管理介面"
    property string itemIntroduction : "伺服器詳細說明"
    property string itemFileSize : "伺服器包裝檔案大小"
    property string introductionURL : "http://www.google.com"
    property int itemProfile0CPU : 0
    property int itemProfile0RAM : 0
    property int itemProfile1CPU : 0
    property int itemProfile1RAM : 0
    property int itemProfile2CPU : 0
    property int itemProfile2RAM : 0
    property int itemMainPort : 0
    //Informations for new server, will be reset every time before adding new server
    property string newServerName : ""
    property int newServerCPU : 0
    property int newServerRAM : 0
    property int newServerPort : 0
    property bool onlyLANAccess : false
    //TODO Hardware Checks Strings

    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent

    onVisibleChanged: {
        if(visible){
            progressbarpane.visible = false
            downloadSucceedPane.visible = false
            bottomPane.visible = true
            tmpCmd.triggerMallDetailViewUpdate()
        }
    }

    function cleanNewServerData(){
        newServerName = ""
        newServerCPU = newServerRAM = newServerPort = 0
        onlyLANAccess = false
        addServerPane.serverNameText = ""
    }

    Image {
        id: ftpimage
        width: 100
        height: 100
        antialiasing: true
        anchors.top: backButton.bottom
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 20
        source: itemIcon
    }

    Label {
        id: ftplabel
        width: 115
        height: 25
        text: itemName
        anchors.top: backButton.bottom
        anchors.topMargin: 22
        anchors.left: ftpimage.right
        anchors.leftMargin: 15
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.family: "Microsoft JhengHei UI";
        font.pointSize: 16
    }
    
    Text {
        id: teamtext
        width: 120
        height: 26
        text: itemProducer
        anchors.top: ftplabel.bottom
        anchors.topMargin: 10
        anchors.left: ftpimage.right
        anchors.leftMargin: 15
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 12
    }

    BackButton{
        id:backButton
        height: 45
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        pageName: itemName
        showBackButton: !(progressbarpane.visible)
        button.onClicked:{
            serverProductInfoPane.visible = false
            serverMallPane.visible = true
            succeedPaneVisible = false
            progressbarpane.visible = false
            bottomPane.visible = true
        }
    }

    Text {
        id: datetext
        width: 110
        height: 26
        text: itemUpdateDate
        anchors.top: teamtext.top
        anchors.topMargin: 0
        anchors.left: teamtext.right
        anchors.leftMargin: 20
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 12
        font.family: "Microsoft JhengHei UI"
        color:"#616161"
    }

    Pane {
        id: pane
        width: 364
        height: 329
        anchors.horizontalCenterOffset: -185
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: ftpimage.bottom
        anchors.topMargin: 20
        padding: 0
        Material.elevation: 3

        ServerProductInfoModule_DetailCard {
            id: button
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: parent.top
            anchors.topMargin: -6
            title:qsTr("作業系統")
            subtitle: itemOperatingSystem
            introduction: qsTr("")
            detail: qsTr("")
        }
        ServerProductInfoModule_DetailCard {
            id: button1
            y: 64
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            anchors.top: button.bottom
            anchors.topMargin: -5
            title:qsTr("控制介面")
            subtitle: itemManagementUI
            introduction: qsTr("簡介")
            detail: itemIntroduction
        }
    }
    ServerProductInfoModule_DetailCard  {
        id: button2
        width: 365
        height: 110
        anchors.horizontalCenterOffset: 195
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: pane.top
        anchors.topMargin: -5
        title:qsTr("硬體檢查")
        subtitle:qsTr("您的電腦符合此伺服器\n的硬體需求。")
        introduction: qsTr("")
        detail: qsTr("")
        Material.elevation : 3
    }

    BottomPane {
        id: bottomPane
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        visible:true

        ServerProductInfoModule_Button {
            id: button3
            x: 687
            title: qsTr("下載 (約") + itemFileSize + qsTr(")")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            visible:true
            onClicked: {
                bottomPane.visible=false
                progressbarpane.visible=true
                tmpCmd.runDownloader(itemIndex)
            }
        }
    }
    Pane {
        id: progressbarpane
        y: 529
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        Material.elevation: 3
        Material.background: "white"
        visible:false

        onVisibleChanged: {
            if(visible){
                controlPane.lock()
            } else {
                controlPane.unlock()
            }
        }

        ProgressBar {
            id: progressBar
            y: 3
            height: 20
            anchors.right: parent.right
            anchors.rightMargin: 365
            anchors.left: parent.left
            anchors.leftMargin: 8
            value: 0
            visible: true
            indeterminate: false
            Material.accent:Material.Blue
        }

        ServerProductInfoModule_Button {
            id: cancelbutton
            x: 644
            y: -11
            title: qsTr("取消")
            anchors.right: parent.right
            anchors.rightMargin: 10
            onClicked: {
                tmpCmd.triggerCancelDownload()
                bottomPane.visible=true
                progressbarpane.visible=false
                downloadSucceedPane.visible=false
            }
        }

        Label {
            id: label7
            x: 455
            y: -1
            width: 145
            height: 29
            text: qsTr("~ / 738 MB")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 14
            font.family: "Microsoft JhengHei UI"
            anchors.right: parent.right
            anchors.rightMargin: 199
        }
    }
    BottomPane {
        id: downloadSucceedPane
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        visible: false

        onVisibleChanged: {
            if(visible){
                progressbarpane.visible = false
            }
        }

        ServerProductInfoModule_Button {
            id: installButton
            x: 687
            title: qsTr("安裝")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 10
            visible:true
            onClicked: {
                cleanNewServerData()
                addServerPane.visible = true
            }
        }
    }

    ServerProductInfoModule_DetailCard {
        id: button4
        subtitle: introductionURL
        anchors.right: button2.right
        anchors.rightMargin: 0
        anchors.left: button2.left
        anchors.leftMargin: 0
        anchors.top: button2.bottom
        anchors.topMargin: 7
        introduction: qsTr("")
        detail: qsTr("")
        title: qsTr("造訪網頁")
        uriInside: true
        Material.elevation : 3
    }

    AddServerPane{
        id: addServerPane
        anchors.fill: parent
        visible: false
    }

    AddServerPane_PerformanceSetting{
        id: addServerPane_PerformanceSetting
        anchors.fill: parent
        visible: false
    }

    AddServerPane_PortSetting{
        id: addServerPane_PortSetting
        anchors.fill: parent
        visible: false
    }

    AddServerPane_PlaceSetting{
        id: addServerPane_PlaceSetting
        anchors.fill: parent
        visible: false
    }
}
