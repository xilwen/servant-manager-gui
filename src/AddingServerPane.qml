import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: addingServerPane
    objectName: "addingServerPane"
    property string progressText: "0%"
    width: 823
    height: 579
    padding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    z:3
    Material.accent: Material.Indigo
    
    BackButton{
        showBackButton: false
        pageName: "正在安裝新伺服器"
    }
    
    Label {
        id: perpareForNewServerLabel
        height: 70
        text: "伺服器架設即將完成，在等候時請先閱讀常見問題。"
        anchors.verticalCenterOffset: -200
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 18
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Microsoft JhengHei UI"
    }
    
    AddServerModule_BottomPane {
        id: addServerModule_BottomPane
        nextButtonVisible: false
        previousButtonVisible: false
        progressIndeterminate: true
        
        Label {
            id: addingPercentLabel
            x: 379
            y: -266
            height: 30
            text: "請稍候...(" + progressText + ")"
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            font.pointSize: 15
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Microsoft JhengHei UI"
            
        }
        
        BusyIndicator {
            id: addingServerBusyIndicator
            x: 352
            y: -299
            width: 32
            height: 32
            anchors.right: addingPercentLabel.left
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter
        }
        
    }

    Pane {
        id: pane
        width: 700
        height: 175
        anchors.horizontalCenter: parent.horizontalCenter
        padding: 0
        anchors.top: perpareForNewServerLabel.bottom
        anchors.topMargin: 5
        Material.elevation: 3

        Label {
            id: perpareForNewServerLabel1
            height: 45
            text: "要怎麼連線到新建立的伺服器？"
            anchors.top: parent.top
            anchors.topMargin: 0
            font.bold: false
            anchors.left: parent.left
            anchors.leftMargin: 10
            font.pointSize: 18
            horizontalAlignment: Text.AlignLeft
            font.family: "Microsoft JhengHei UI"
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: perpareForNewServerLabel2
            x: 3
            y: -9
            height: 45
            text: "安裝完成後，「管理伺服器」介面會提供這項資訊，在應用程式中輸入（例如：在瀏覽器的網址列輸入）即可。\n由於網路環境可能較複雜，仍無法連線請嘗試其他已知的IP（可由診斷頁面獲得），或請教管理網路的人員。"
            anchors.right: parent.right
            anchors.rightMargin: 10
            wrapMode: Text.WordWrap
            font.pointSize: 14
            horizontalAlignment: Text.AlignLeft
            anchors.topMargin: 0
            font.bold: false
            font.family: "Microsoft JhengHei UI"
            anchors.top: perpareForNewServerLabel1.bottom
            verticalAlignment: Text.AlignTop
            anchors.left: parent.left
            anchors.leftMargin: 10
        }
    }

    Pane {
        id: pane1
        x: -9
        width: 700
        height: 175
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.top: pane.bottom
        Label {
            id: perpareForNewServerLabel3
            height: 45
            text: "伺服器管理"
            font.pointSize: 18
            horizontalAlignment: Text.AlignLeft
            anchors.topMargin: 0
            font.bold: false
            font.family: "Microsoft JhengHei UI"
            anchors.top: parent.top
            verticalAlignment: Text.AlignVCenter
            anchors.left: parent.left
            anchors.leftMargin: 10
        }

        Label {
            id: perpareForNewServerLabel4
            x: 3
            y: -9
            height: 45
            text: "伺服器開機完成後，點選「管理伺服器」中的「管理介面網址」即會在瀏覽器中打開該伺服器的網頁管理介面。\n「伺服器設定資訊」則可檢視該伺服器設定時需要注意的事項。"
            font.pointSize: 14
            horizontalAlignment: Text.AlignLeft
            anchors.topMargin: 0
            font.bold: false
            font.family: "Microsoft JhengHei UI"
            anchors.rightMargin: 10
            anchors.top: perpareForNewServerLabel3.bottom
            verticalAlignment: Text.AlignTop
            wrapMode: Text.WordWrap
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
        }
        Material.elevation: 3
        padding: 0
        anchors.left: perpareForNewServerLabel.left
        anchors.leftMargin: -75
    }
}
