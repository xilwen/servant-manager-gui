import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1
BottomPane {
    id: bottomPane
    property alias previousButtonText: defaultButton1.title
    property alias nextButtonText: defaultButton.title
    property alias previousButton: defaultButton1
    property alias nextButton: defaultButton
    property alias nextButtonVisible: defaultButton.visible
    property alias previousButtonVisible: defaultButton1.visible
    property alias progressValue: bottomPaneProgressBar.value
    property alias progressIndeterminate: bottomPaneProgressBar.indeterminate
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 0
    anchors.right: parent.right
    anchors.rightMargin: 0
    anchors.left: parent.left
    anchors.leftMargin: 0

    onProgressValueChanged: {
        progressIndeterminate = false
    }

    AddServerModule_Button {
        id: defaultButton
        x: 572
        imageOnLeft: false
        title: qsTr("開始安裝")
        addServerHintImage:"icon/ic_skip_next_black_24dp_2x.png"
        leftPadding: 36
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 10
    }

    AddServerModule_Button {
        id: defaultButton1
        x: 573
        y: -6
        leftPadding: 36
        anchors.rightMargin: 20
        anchors.right: defaultButton.left
        anchors.verticalCenter: parent.verticalCenter
        imageOnLeft: true
        title: qsTr(" 回到上一頁")
        addServerHintImage: "icon/ic_skip_previous_black_24dp_2x.png"
    }

    ProgressBar {
        id: bottomPaneProgressBar
        y: 11
        anchors.right: parent.right
        anchors.rightMargin: -12
        anchors.left: parent.left
        anchors.leftMargin: -12
        anchors.bottom: parent.top
        anchors.bottomMargin: 10
        value: 0.25
        indeterminate: false
        Material.accent: Material.Indigo
    }
}
