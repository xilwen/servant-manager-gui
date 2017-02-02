import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0

Pane {
    id: controlPane
    width: 200
    height: 200
    rightPadding: 0
    leftPadding: 0
    Layout.minimumWidth: 50
    Layout.maximumWidth: 200
    Layout.fillHeight: true
    Layout.fillWidth: true
    Material.background: "#eeeeee"

    Button {
        id: button1
        width: 30
        text: "我的伺服器"
        padding: 0
        visible: true
        font.family: "Microsoft JhengHei UI"
        font.pointSize: 12
        leftPadding: -10
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        Material.background: mouseArea.containsMouse? Material.Blue : "#eeeeee"
        Material.elevation: 0

        MouseArea{
            id:mouseArea
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                overviewPane.visible = true
                serverInfoPane.visible = false
                serverProductInfoPane.visible = false
                serverMallPane.visible = false
            }
        }

        Image{
            id: image1
            width: 24
            height: 24
            z: 3
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 15
            source: "./icons/ic_storage_black_24dp_1x.png"
            sourceSize.height: 24
            sourceSize.width: 24
            fillMode: Image.Stretch
        }
    }

    Button {
        id: button3
        x: -6
        y: -3
        width: 30
        text: qsTr("伺服器商城")
        padding: 0
        font.pointSize: 12
        anchors.right: parent.right
        leftPadding: -10
        anchors.topMargin: 0
        anchors.left: parent.left
        visible: true
        anchors.top: button1.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        font.family: "Microsoft JhengHei UI"
        Material.background: mouseArea1.containsMouse? "#ff8a80" : "#eeeeee"
        Material.elevation: 0

        MouseArea{
            id:mouseArea1
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                overviewPane.visible = false
                serverInfoPane.visible = false
                serverProductInfoPane.visible = false
                serverMallPane.visible = true
            }
        }
        Image{
            id: image2
            width: 24
            height: 24
            z: 3
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 15
            source: "./icons/ic_store_black_24dp_1x.png"
            sourceSize.height: 24
            sourceSize.width: 24
            fillMode: Image.Stretch
        }
    }


    Button {
        id: button4
        x: -11
        width: 30
        text: qsTr("診斷　　　")
        padding: 0
        font.pointSize: 12
        anchors.right: parent.right
        anchors.topMargin: 0
        leftPadding: -10
        anchors.left: parent.left
        visible: true
        anchors.top: button3.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        font.family: "Microsoft JhengHei UI"
        Material.background: mouseArea2.containsMouse? "#a7ffeb" : "#eeeeee"
        Material.elevation: 0
        MouseArea{
            id:mouseArea2
            anchors.fill: parent
            hoverEnabled: true
        }
        Image{
            id: image3
            width: 24
            height: 24
            z: 3
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 15
            source: "./icons/ic_build_black_24dp_1x.png"
            sourceSize.height: 24
            sourceSize.width: 24
            fillMode: Image.Stretch
        }
    }

    Button {
        id: button5
        x: -5
        width: 30
        height: 48
        text: qsTr("分享和備份")
        padding: 0
        font.pointSize: 12
        anchors.right: parent.right
        anchors.topMargin: 0
        leftPadding: -10
        anchors.left: parent.left
        visible: true
        anchors.top: button4.bottom
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        font.family: "Microsoft JhengHei UI"
        Material.background: mouseArea3.containsMouse? "#ffd180" : "#eeeeee"
        Material.elevation: 0
        MouseArea{
            id:mouseArea3
            anchors.fill: parent
            hoverEnabled: true
        }
        Image{
            id: image4
            width: 24
            height: 24
            z: 3
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 15
            source: "./icons/ic_share_black_24dp_1x.png"
            sourceSize.height: 24
            sourceSize.width: 24
            fillMode: Image.Stretch
        }
    }

    Button {
        id: button6
        x: -3
        width: 30
        text: qsTr("偏好設定　")
        padding: 0
        font.pointSize: 12
        anchors.right: parent.right
        anchors.topMargin: 0
        leftPadding: -10
        anchors.left: parent.left
        visible: true
        anchors.top: button5.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        font.family: "Microsoft JhengHei UI"
        Material.background: mouseArea4.containsMouse? "#8c9eff" : "#eeeeee"
        Material.elevation: 0
        MouseArea{
            id:mouseArea4
            anchors.fill: parent
            hoverEnabled: true
        }
        Image{
            id: image5
            width: 24
            height: 24
            z: 3
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 15
            source: "./icons/ic_settings_black_24dp_1x.png"
            sourceSize.height: 24
            sourceSize.width: 24
            fillMode: Image.Stretch
        }
    }
}
