import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2
Pane {
    id: overviewPane
    objectName: "overviewPane"
    width: 900
    height: 640
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent

    Flickable {
        id: flickable
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        ScrollBar.vertical: ScrollBar {active:true }

        Label {
            id: installedLabel
            x: 3
            y: 188
            text: qsTr("已安裝的伺服器")
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 20
            anchors.top: parent.top
            anchors.topMargin: 200
            anchors.left: parent.left
            anchors.leftMargin: 15

            ServerObjectButton{
                id: machinePane1
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.bottom
                anchors.topMargin: 20
                objectName: "machinePane1"
                onClicked: {
                    overviewPane.visible = false
                    serverInfoPane.visible = true
                }
            }

        }

        Label {
            id: label1
            x: 3
            y: 8
            text: qsTr("安裝新的伺服器")
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 20
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 15

            Button {
                id: importButton
                width: 300
                height: 75
                bottomPadding: 0
                rightPadding: 0
                leftPadding: 0
                topPadding: 0
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.bottom
                anchors.topMargin: 20
                Material.background: "#FFFFFF"
                Material.elevation: 3
                onClicked: fileDialog.open()
                Image{
                    id: openImage
                    width: 48
                    height: 48
                    z: 3
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    source: "./icons/ic_folder_black_48dp_2x.png"
                    sourceSize.height: 60
                    sourceSize.width: 60
                    fillMode: Image.Stretch
                }
                Label {
                    id: label2
                    text: qsTr("從檔案新增自訂伺服器")
                    font.family: "Microsoft JhengHei UI"
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: openImage.right
                    anchors.leftMargin: 10
                    font.pointSize: 14
                }

                FileDialog {
                    id: fileDialog
                    objectName: "fileDialog"
                    title: "選擇要匯入的VirtualBox虛擬機器包裝(*.ova)"
                    nameFilters: [ "OVA (*.ova)" ]
                    selectMultiple: false
                    selectExisting: true
                    selectFolder: false
                    folder: shortcuts.home
                    visible: false
                    onAccepted: {
                        mainWindow.importPackage()
                    }
                    onRejected: {
                        console.log("Canceled")
                    }
                }
            }

            Button {
                id: importButton1
                x: 6
                y: 7
                width: 300
                height: 75
                Image {
                    id: openImage1
                    width: 48
                    height: 48
                    sourceSize.width: 60
                    source: "./icons/ic_folder_black_48dp_2x.png"
                    fillMode: Image.Stretch
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    z: 3
                    sourceSize.height: 60
                }

                Label {
                    id: label3
                    text: qsTr("新增 FTP 伺服器")
                    font.pointSize: 14
                    font.family: "Microsoft JhengHei UI"
                    anchors.top: parent.top
                    anchors.left: openImage1.right
                    anchors.topMargin: 10
                    anchors.leftMargin: 10
                }
                onClicked: {
                    overviewPane.visible = false
                    importPane.visible = true
                }

                leftPadding: 0
                topPadding: 0
                bottomPadding: 0
                rightPadding: 0
                anchors.top: parent.bottom
                anchors.left: parent.left
                anchors.topMargin: 20
                anchors.leftMargin: 350
                Material.background: "#FFFFFF"
                Material.elevation: 3
            }
        }
    }
}
