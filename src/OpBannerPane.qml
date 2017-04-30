import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: opBannerPane
    property alias pageName: label.text
    property bool haveDesciprtion: true
    property alias pageDescription: label1.text
    property alias pageIcon: image.source
    property string backgroundColor: "#424242"
    width: 800
    height: (haveDesciprtion) ?100 : 65
    rightPadding: 0
    bottomPadding: 0
    leftPadding: 0
    topPadding: 0
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.left: parent.left
    anchors.leftMargin: 0
    Material.background: backgroundColor
    Material.foreground: "#ffffff"
    Material.elevation: 5

    Label {
        id: label
        text: qsTr("頁面名稱")
        anchors.top: parent.top
        anchors.topMargin: (haveDesciprtion) ? 15 : 13
        font.pointSize: 23
        font.family: "Microsoft JhengHei UI"
        anchors.left: parent.left
        anchors.leftMargin: 15
    }

    Label {
        id: label1
        x: 0
        y: -8
        text: qsTr("頁面敘述")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.right: parent.right
        anchors.rightMargin: 120
        font.pointSize: 14
        anchors.left: parent.left
        anchors.topMargin: 0
        anchors.leftMargin: 15
        font.family: "Microsoft JhengHei UI"
        anchors.top: label.bottom
        visible: (haveDesciprtion) ? true:false
    }

    Image {
        id: image
        width: 64
        height: 64
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 15
        source: "icon/ic_arrow_back_white_24dp_1x.png"
    }
}
