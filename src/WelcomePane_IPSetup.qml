import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: welcomePane_IPSetup
    objectName: "welcomeIPPane"
    property string ipconfigText :""
    width: 1024
    height: 640
    padding: 0
    rightPadding: 0
    bottomPadding: 0
    leftPadding: 0
    topPadding: 0
    Material.theme: Material.Dark

    onVisibleChanged: {
        if(visible){
            tmpCmd.triggerFirstTimeIP()
        }
    }

    function isNumeric(n) {
        return !isNaN(parseFloat(n)) && isFinite(n);
    }

    Pane {
        id: pane
        y: 428
        height: 75
        z: 1
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        padding: 0
        Material.background: "#3e50b4"
        Material.elevation: 10

        Button {
            id: button
            x: 816
            y: 10
            width: 198
            text: qsTr("下一步")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.top: parent.top
            anchors.topMargin: 0
            font.family: "Microsoft JhengHei UI"
            anchors.right: parent.right
            font.pointSize: 18
            anchors.rightMargin: 0
            Material.background: "#3e50b4"
            Material.elevation: 0
            z: 1
            visible: false

            Image {
                id: image
                x: 118
                y: 11
                width: 36
                height: 36
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 18
                source: "icon/ic_keyboard_arrow_right_white_36dp.png"
            }

            onClicked: {
                tmpCmd.triggerSetupLocalIP(textField.text);
                perfMeterPane.visible = true
                welcomePane_IPSetup.visible = false
                tmpCmd.triggerRepositoryUpdate()
                tmpCmd.runHardwareAssessment()
            }
        }
    }

    Label {
        id: label
        x: 429
        y: 113
        text: qsTr("設定本機的 IP 位址")
        font.family: "Microsoft JhengHei UI"
        anchors.verticalCenterOffset: -175
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 48
    }

    Label {
        id: label1
        x: 272
        y: 239
        text: qsTr("請輸入這台電腦的 IP 位址。\n以下會顯示作業系統提供的網路資訊，通常\"預設閘道\"一欄有資料者，\n其上方的 IPv4 位址就是需要輸入的數據。\n當反白系統提供的 IP 位置時，將會為您自動輸入IP。")
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: -87
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Microsoft JhengHei UI";
        font.pointSize: 14
    }

    Flickable{
        id: ipconfigFlickable
        width: 560
        height: 150
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenterOffset: 50
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        contentHeight: ipconfigLabel.contentHeight
        clip: true
        ScrollBar.vertical: ScrollBar {
            id: vbar
            active: true
            parent: ipconfigFlickable.parent
            anchors.top: ipconfigFlickable.top
            anchors.left: ipconfigFlickable.right
            anchors.bottom: ipconfigFlickable.bottom
            onActiveChanged: {
                active = true
            }
        }

        TextEdit {
            id: ipconfigLabel
            color: "#ffffff"
            height: 1000
            text: (welcomePane_IPSetup.ipconfigText == "") ? "無法顯示來自作業系統的資訊。" : ipconfigText
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            textFormat: Text.AutoText
            readOnly: true
            cursorVisible: true
            wrapMode: Text.Wrap
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 13
            selectByMouse: true
            onSelectedTextChanged: {
                if(isNumeric(selectedText[0])){
                    textField.text = selectedText
                }
            }
        }
    }

    TextField {
        id: textField
        y: 468
        selectByMouse: true
        placeholderText: "在這裡輸入此電腦的 IP，或在上方文字區塊反白..."
        anchors.right: label1.right
        anchors.rightMargin: 0
        anchors.left: label1.left
        anchors.leftMargin: 0
        font.family: "Microsoft JhengHei UI"
        opacity: 0.9
        property bool formatOK: false
        property int dotCount: 0
        property int ii: 0
        onTextChanged: {
            formatOK = true
            dotCount = 0
            for(ii = 0; ii < text.length; ++ii){
                if(!isNumeric(text[ii]) && text[ii] !== "."){
                    formatOK = false
                } else {
                    if(text[ii] === "."){
                        ++dotCount;
                    }
                }
            }
            if(dotCount != 3 || !isNumeric(text[text.length - 1])){
                formatOK = false
            }
            button.visible = formatOK
        }

    }

    Label {
        id: label2
        x: 265
        text: qsTr("IP的正確格式如：192.168.0.1，以三個英文句點分隔，其他皆為數字。")
        anchors.top: textField.bottom
        anchors.topMargin: 0
        anchors.verticalCenterOffset: -87
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Microsoft JhengHei UI"
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 12
        anchors.horizontalCenterOffset: 0
        visible: !button.visible
    }
}
