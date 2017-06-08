import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: settingPane
    objectName: "settingPane"
    width: 823
    height: 579
    leftPadding: 0
    rightPadding: 0
    bottomPadding: 0
    topPadding: 0
    anchors.rightMargin: 0
    anchors.bottomMargin: 0
    anchors.leftMargin: 0
    anchors.topMargin: 0
    anchors.fill: parent
    property string localIPAddress: "127.0.0.1"
    property bool changed: false;
    property alias repoUrl: textField.text

    onVisibleChanged: {
        if(visible){
            tmpCmd.triggerSettingPaneUpdate()
            if(repoUrl !== "http://134.208.2.142:8090/SERVANT/repo/"){
                checkBox2.checked = true
            } else {
                checkBox2.checked = false
            }
            changed = false
        }
    }

    OpBannerPane {
        id: opBannerPane
        haveDesciprtion: false
        pageName: "偏好設定"
        pageDescription: ""
        pageIcon: "icon/ic_settings_applications_white_48dp_2x.png"
    }

    Pane{
        id: generalCategoryPane
        height: 120
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: opBannerPane.bottom
        anchors.topMargin: 25
        Material.background: "#ffffff"
        Material.elevation: 5
        Label {
            id: generallabel
            width: 133
            height: 36
            text: qsTr("一般")
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 22
            font.family: "Microsoft JhengHei UI";
        }
        ServerObjectButton{
            id: servantsitebutton
            serverTitle: qsTr("服務來源")
            serverSubtitle: qsTr("設定提供 SERVANT 服務的伺服器")
            serverImageSource:"icon/ic_shopping_basket_2x.png"
            anchors.top: generallabel.bottom
            anchors.topMargin: 164
            anchors.left: parent.left
            anchors.leftMargin: 347
            onClicked:{
                setting_RepositoryPane.visible = true
            }
        }

        TextField {
            id: textField1
            y: 56
            text: localIPAddress
            bottomPadding: 8
            font.pointSize: 14
            anchors.verticalCenter: generallabel1.verticalCenter
            verticalAlignment: Text.AlignTop
            anchors.right: parent.right
            anchors.leftMargin: 10
            selectByMouse: true
            font.family: "Microsoft JhengHei UI"
            anchors.left: generallabel1.right
            horizontalAlignment: Text.AlignLeft
            anchors.rightMargin: 10
            onTextChanged: {
                changed = true
            }
        }

        Label {
            id: generallabel1
            x: 5
            width: 158
            height: 36
            text: qsTr("設定本機 IP 位址：")
            anchors.top: generallabel.bottom
            anchors.topMargin: 10
            font.bold: false
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 10
            font.family: "Microsoft JhengHei UI"
            anchors.left: parent.left
            horizontalAlignment: Text.AlignLeft
            font.pointSize: 14
        }
    }

    Pane{
        id: onlineServiceCategoryPane
        height: 180
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: generalCategoryPane.bottom
        anchors.topMargin: 25
        Material.background: "#ffffff"
        Material.elevation: 5


        Label {
            id: onlineServiceLabel
            width: 133
            height: 36
            text: qsTr("線上服務")
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 22
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }

        CheckBox {
            id: checkBox2
            x: 3
            y: 7
            text: qsTr("自訂線上服務來源伺服器")
            anchors.left: onlineServiceLabel.left
            anchors.topMargin: 10
            anchors.leftMargin: 0
            anchors.top: onlineServiceLabel.bottom
            checkable: true
            checked: false
            font.pointSize: 14
            font.family: "Microsoft JhengHei UI"
            onVisibleChanged: changeUrlUI()
            onCheckedChanged: {
                changed = true
                changeUrlUI()
            }
            function changeUrlUI(){
                if(checkBox2.checked){
                    textField.visible = true
                    descriptionLabel.visible = false
                }else{
                    textField.visible = false
                    descriptionLabel.visible = true
                }
            }
        }

        Label {
            id: descriptionLabel
            x: -17
            height: 35
            text: "SERVANT 的線上服務來源伺服器提供您探索並下載新的伺服器。除了使用預設的來源之外，也可以使用自行建立的服務來源伺服器，但請小心安全。"
            anchors.right: parent.right
            anchors.rightMargin: 10
            wrapMode: Text.WordWrap
            anchors.top: checkBox2.bottom
            horizontalAlignment: Text.AlignLeft
            anchors.left: checkBox2.left
            verticalAlignment: Text.AlignTop
            font.pointSize: 14
            anchors.leftMargin: 35
            font.family: "Microsoft JhengHei UI"
            anchors.topMargin: 0
        }

        TextField {
            id: textField
            text: qsTr("")
            anchors.leftMargin: 35
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.top: checkBox2.bottom
            horizontalAlignment: Text.AlignLeft
            anchors.left: checkBox2.left
            verticalAlignment: Text.AlignTop
            selectByMouse: true
            font.family: "Microsoft JhengHei UI"
            onTextChanged: {
                changed = true
            }
        }
    }

    Pane {
        id: bottomPane
        height: 50
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        Material.elevation: 3
        visible: (changed)? true: false

        Button {
            id: button_Save
            x: 687
            width: 220
            height: 48
            text: qsTr("套用")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 14
            anchors.rightMargin: 10
            Material.elevation: 0
            Material.background: "white"
            onClicked: {
                tmpCmd.triggerSetupLocalIP(textField1.text);
                if(checkBox2.checked){
                    tmpCmd.triggerMallRepoUrlUpdate(repoUrl)
                }else{
                    tmpCmd.triggerMallRepoUrlUpdate("http://134.208.2.142:8090/SERVANT/repo/")
                }
                changed = false
            }
        }
    }
}


