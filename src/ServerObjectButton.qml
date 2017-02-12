import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0
import QtQuick.Dialogs 1.2
import QtQuick 2.0

Button {
    id: button
    width: 300
    height: 75
    Layout.alignment: Qt.AlignLeft | Qt.AlignTop
    property alias serverSubtitle: serverSubtitle.text
    property alias serverTitle: serverTitle.text
    property alias serverImageSource: serverImage.source
    property alias importProgressValue: importPBar.value
    property alias importProgressIndeterminate : importPBar.indeterminate
    property alias importProgressVisible : importPBar.visible
    Layout.minimumHeight: 75
    Layout.minimumWidth: 300
    Layout.maximumHeight: 75
    Layout.maximumWidth: 300
    opacity: 1
    visible: true
    bottomPadding: 0
    rightPadding: 0
    leftPadding: 0
    topPadding: 0
    Material.background: "#FFFFFF"
    Material.elevation: 3
    onClicked: {
        mainWindow.setName1()
        serverInfoPane.visible = true
        overviewPane.visible = false
    }

    Image{
        id: serverImage
        width: 48
        height: 48
        z: 3
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        source: "icon/ic_folder_black_48dp_2x.png"
        sourceSize.height: 60
        sourceSize.width: 60
        fillMode: Image.Stretch
    }
    Label {
        id: serverTitle
//        objectName: "newServerName"
        text: qsTr("伺服器名稱")
        font.family: "Microsoft JhengHei UI"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.left: serverImage.right
        anchors.leftMargin: 10
        font.pointSize: 14
    }

    ProgressBar {
        id: importPBar
//        objectName: "importBusy"
        width: 219
        height: 6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.left: serverImage.right
        anchors.leftMargin: 10
        visible: false
    }

    Label {
        id: serverSubtitle
        x: 256
//        text: qsTr("伺服器類型或者安裝進度")
        horizontalAlignment: Text.AlignRight
        font.family: "Microsoft JhengHei UI"
        anchors.right: parent.right
        anchors.rightMargin: 13
        anchors.top: serverTitle.bottom
        anchors.topMargin: 3
        anchors.bottom: importPBar.top
        anchors.bottomMargin: 3
    }
}
