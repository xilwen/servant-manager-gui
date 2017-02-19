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


Pane {
    id: controlpane
    width: 200
    height: 600
    rightPadding: 0
    leftPadding: 0
    Layout.minimumWidth: 50
    Layout.maximumWidth: 200
    Layout.fillHeight: true
    Layout.fillWidth: true
    Material.background: "#ffffff"
    Button {
        id: buttonserver
        x: 57
        y: 21
        width: 143
        height: 62
        Material.background:servermouseArea.containsMouse?"#00aa00":"white"
        Material.elevation: 0
        Text{
            width: 141
            height: 25
            anchors.centerIn: parent
            text:qsTr("我的伺服器   ")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 6
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 15
            color:servermouseArea.containsMouse?"white":"black"
        }
        MouseArea {
            id: servermouseArea
            anchors.leftMargin: 0
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                overviewPane.visible=true
                serverMallPane.visible=false
                serverProductInfoPane.visible=false
                diagnosisPane.visible=false
                sharePane.visible=false
                settingPane.visible=false

                }
        }

        Rectangle {
            id:imagebackground1
            y: 6
            width: 57
            height: 50
            color: "#00aa00"
            anchors.left: parent.left
            anchors.leftMargin: -57

            Image {
                id: serverimage
                width: 32
                anchors.right: parent.right
                anchors.rightMargin: 11
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 9
                anchors.top: parent.top
                anchors.topMargin: 9
                source: "icon/ic_storage_white_24dp_1x.png"
            }
        }

    }
    Button {
        id: buttonstore
        x: 57
        y: 71
        width: 143
        height: 62
        Material.background:storemouseArea.containsMouse?"#E91E63":"white"
        Material.elevation: 0
        MouseArea {
            id: storemouseArea
            x: 0
            y: -48
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            hoverEnabled: true
            anchors.fill: parent
            onClicked: {
                overviewPane_Empty.visible=false
                overviewPane_Normal.visible=false
                serverMallPane.visible=true
                serverProductInfoPane.visible=false
                diagnosisPane.visible=false
                sharePane.visible=false
                settingPane.visible=false

            }
        }

        Text {
            x: 0
            y: 60
            width: 141
            height: 25
            color: storemouseArea.containsMouse ? "white" : "black"
            text: qsTr("伺服器商城   ")
            anchors.verticalCenterOffset: 0
            anchors.horizontalCenterOffset: 6
            anchors.centerIn: parent
            font.pointSize: 15
            font.family: "Microsoft JhengHei UI"
        }

        Rectangle {
            id: imagebackground2
            y: 6
            width: 57
            height: 50
            color: "#E91E63"
            anchors.left: parent.left
            anchors.leftMargin: -57
            Image {
                id: storeimage
                width: 32
                anchors.right: parent.right
                anchors.rightMargin: 11
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 9
                anchors.top: parent.top
                anchors.topMargin: 9
                source: "icon/ic_store_white_24dp_1x.png"
            }
        }
    }

    Button {
        id: buttondiagnosis
        x: 57
        y: 121
        width: 143
        height: 62
        Material.background:diagnosismouseArea.containsMouse?"#2196F3":"white"
        Material.elevation:0
        Text{
            width: 135
            height: 25
            anchors.centerIn: parent
            text:qsTr("診斷              ")
            anchors.verticalCenterOffset: 1
            anchors.horizontalCenterOffset: 4
            font.family: "Microsoft JhengHei UI"
            font.pointSize: 15
            color: diagnosismouseArea.containsMouse ? "white" : "black"
        }

        MouseArea {
            id: diagnosismouseArea
            x: 0
            y: 0
            hoverEnabled: true
            anchors.fill: parent
            onClicked: {
                overviewPane_Empty.visible=false
                overviewPane_Normal.visible=false
                serverMallPane.visible=false
                serverProductInfoPane.visible=false
                diagnosisPane.visible=true
                sharePane.visible=false
                settingPane.visible=false

            }
        }

        Rectangle {
            id: imagebackground3
            y: 6
            width: 57
            height: 50
            color: "#2196F3"
            anchors.left: parent.left
            anchors.leftMargin: -57
            Image {
                id: diagnosisimage
                anchors.right: parent.right
                anchors.rightMargin: 11
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 9
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.top: parent.top
                anchors.topMargin: 9
                source: "icon/ic_build_white_24dp_1x.png"
            }
        }
    }

    Button {
        id: buttonshare
        x: 57
        y: 171
        width: 143
        height: 62
        Material.background: sharemouseArea.containsMouse?"#3F51B5":"white"
        Material.elevation:0
        Text {
            width: 141
            height: 25
            color: sharemouseArea.containsMouse ? "white" : "black"
            text: qsTr("分享及備份       ")
            anchors.verticalCenterOffset: 1
            anchors.horizontalCenterOffset: 7
            anchors.centerIn: parent
            font.pointSize: 15
            font.family: "Microsoft JhengHei UI"
        }

        MouseArea {
            id: sharemouseArea
            x: 0
            y: 0
            hoverEnabled: true
            anchors.fill: parent
            onClicked: {
                overviewPane_Empty.visible=false
                overviewPane_Normal.visible=false
                serverMallPane.visible=false
                serverProductInfoPane.visible=false
                diagnosisPane.visible=false
                sharePane.visible=true
                settingPane.visible=false

            }
        }

        Rectangle {
            id: imagebackground4
            y: 6
            width: 57
            height: 50
            color: "#3F51B5"
            anchors.left: parent.left
            anchors.leftMargin: -57
            Image {
                id: shareimage
                anchors.right: parent.right
                anchors.rightMargin: 11
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 9
                anchors.top: parent.top
                anchors.topMargin: 9
                source: "icon/ic_share_white_24dp_1x.png"
            }
        }
    }

    Button {
        id: buttonsetting
        x: 57
        y: 221
        width: 143
        height: 62
        Material.background: settingmouseArea.containsMouse?"#9E9E9E":"white"
        Material.elevation:0
        Text {
            width: 129
            height: 25
            color: settingmouseArea.containsMouse ? "white" : "black"
            text: qsTr("偏好設定        ")
            anchors.verticalCenterOffset: 1
            anchors.horizontalCenterOffset: 1
            anchors.centerIn: parent
            font.pointSize: 15
            font.family: "Microsoft JhengHei UI"
        }

        MouseArea {
            id: settingmouseArea
            x: 0
            y: 0
            hoverEnabled: true
            anchors.fill: parent
            onClicked: {
                overviewPane_Empty.visible=false
                overviewPane_Normal.visible=false
                serverMallPane.visible=false
                serverProductInfoPane.visible=false
                diagnosisPane.visible=false
                sharePane.visible=false
                settingPane.visible=true

            }
        }

        Rectangle {
            id: imagebackground5
            y: 6
            width: 57
            height: 50
            color: "#9E9E9E"
            anchors.left: parent.left
            anchors.leftMargin: -57
            Image {
                id: settingimage
                anchors.right: parent.right
                anchors.rightMargin: 11
                anchors.left: parent.left
                anchors.leftMargin: 15
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 9
                anchors.top: parent.top
                anchors.topMargin: 9
                source: "icon/ic_settings_white_24dp_1x.png"
            }
        }
    }
}
