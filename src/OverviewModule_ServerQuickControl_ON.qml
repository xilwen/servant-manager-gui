import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: pane
    width: 700
    height: 380
    anchors.top: parent.top
    anchors.topMargin: 54
    Material.background: "White"
    Material.elevation:3
    Material.accent:"#FFFFFF"
    Label {
        id: titleLabel
        width: 144
        height: 36
        text: qsTr("快速控制")
        anchors.left: parent.left
        anchors.leftMargin: 7
        anchors.top: parent.top
        anchors.topMargin: 7
        verticalAlignment: Text.AlignVCenter
        font.family: "Microsoft JhengHei UI";
        font.pointSize: 22
    }

    OverviewModule_ServerQuickControlBlock{
        id: block0
        name: (serverInfoPane.webminStatus != 2)? "啟動 Webmin 管理介面" : "停止 Webmin 管理介面"
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: titleLabel.left
        anchors.leftMargin: 0
        anchors.top: titleLabel.bottom
        anchors.topMargin: 10
        imageSource: "icon/ic_build_black_48dp_2x.png"
        showAdditionalButton: true
        additionalButtonIsInfo: (serverInfoPane.webminStatus != 2)? true : false
        additionalButton.text: (serverInfoPane.webminStatus == 2)? "開啟Webmin" : "詳細資訊"
        onClicked: {
            switch(serverInfoPane.webminStatus){
            case 0:

                break
            case 1:
                errorHappenedPane.open("無法使用Webmin","其他伺服器或程式佔用了 10000 連接埠。請先關閉其他伺服器的 Webmin。")
                break
            case 2:

                break
            }
        }
        additionalButton.onClicked: {
            if(serverInfoPane.webminStatus == 2){
                tmpCmd.triggerStartURI("http://localhost:10000")
            } else {
                errorHappenedPane.open("關於 Webmin","Webmin 是基於網頁介面的系統/伺服器控制工具，可以透過網頁界面更新軟體，設定伺服器參數，上傳檔案等。\n為了安全考量，SERVANT 只會在有需求的時候才打開 Webmin 的連接埠。")
            }

        }
    }
}
