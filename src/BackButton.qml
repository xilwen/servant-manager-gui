import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: backButton
    property alias pageName: label.text
    height: 45
    property alias button: button
    rightPadding: 0
    bottomPadding: 0
    leftPadding: 0
    topPadding: 0
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.left: parent.left
    anchors.leftMargin: 0
    Material.background: "#424242"
    Material.foreground: "#ffffff"
    Material.elevation: 5

    Label {
        id: label
        text: qsTr(" 頁面名稱")
        font.pointSize: 14
        font.family: "Microsoft JhengHei UI"
        anchors.left: button.right
        anchors.leftMargin: 0
        anchors.verticalCenter: parent.verticalCenter
    }

    Button {
        id: button
        width: 47
        height: 48
        text: qsTr("     ")
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.verticalCenter: parent.verticalCenter
        Material.elevation: 0
        Image{
            width: 24
            height: 24
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "icon/ic_arrow_back_white_24dp_1x.png"
        }
    }
}
