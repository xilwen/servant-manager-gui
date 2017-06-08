import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1
import QtQuick.Dialogs 1.2

Pane {
    id: pane
    width: 750
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
        font.family: qsTr("Microsoft JhengHei UI")
        font.pointSize: 22
    }

    OverviewModule_ServerQuickControlBlock{
        id: block0
        name: qsTr("刪除伺服器")
        height: 45
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: titleLabel.left
        anchors.leftMargin: 0
        anchors.top: titleLabel.bottom
        anchors.topMargin: 10
        info: qsTr("完整移除相關的檔案")
        imageSource: "icon/ic_delete_black_48dp_2x.png"
        onClicked:{
            tmpCmd.deleteServer(serverInfoPane.itemIndex)
            serverInfoPane.visible = false
        }
    }

    OverviewModule_ServerQuickControlBlock{
        id: block2
        anchors.left: titleLabel.left
        anchors.leftMargin: 0
        anchors.top: block1.bottom
        anchors.topMargin: 0
        name: qsTr("如何在 VirtualBox 中檢視 SERVANT 建立的伺服器？")
        height: 45
        anchors.right: parent.right
        anchors.rightMargin: 0
        info: qsTr("")
        imageSource: "icon/ic_exit_to_app_black_48dp_2x.png"
        onClicked: {
            errorHappenedPane.open("如何在 VirtualBox 中修改伺服器(進階)", "因為 SERVANT 以系統服務執行，需要用系統服務權限執行 VirtualBox 才能看到您建立的伺服器。\n首先，請先確定伺服器已關機，並關閉 SERVANT，以避免讀寫衝突。\n您需要使用 PAExec 或類似功能的軟體，PAExec 的官方網站為 https://www.poweradmin.com/paexec/ 。\n用 paexec -s -i \"電腦上安裝的VirtualBox.exe絕對路徑\" 即可啟動 Virtualbox。")
        }
    }

    OverviewModule_ServerQuickControlBlock {
        id: block1
        name: qsTr("匯出伺服器")
        height: 45
        info: qsTr("")
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.top: block0.bottom
        imageSource: "icon/ic_call_made_black_24dp_2x.png"
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.left: titleLabel.left
        onClicked:{
            exportFileDialog.open()
        }
    }

    FileDialog{
        id: exportFileDialog
        selectExisting: false
        title: "匯出虛擬機器"
        nameFilters: [ "OVA (*.ova)" ]
        visible: false
        onAccepted: {
            if(exportFileDialog.fileUrls[0].length > 0){
                exportOVAStatusPane.visible = true
                tmpCmd.triggerExportOVA(serverInfoPane.itemIndex, exportFileDialog.fileUrls[0].toString())
            } else {
                errorHappenedPane.open("檔名無效","請使用有效的檔案名稱。")
            }
        }
    }
}
