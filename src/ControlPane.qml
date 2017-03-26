import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.1

Pane {
    id: controlpane
    objectName: "controlPane"
    width: 200
    height: 600
    rightPadding: 0
    leftPadding: 0
    property bool noMachineCreated: true
    Layout.minimumWidth: 50
    Layout.maximumWidth: 200
    Layout.fillHeight: true
    Layout.fillWidth: true
    Material.background: "#ffffff"
    Material.elevation: 5
    ControlModule_Button {
        id: buttonserver
        x: 57
        y: 21
        title: "我的伺服器   "
        image: "icon/ic_storage_white_24dp_1x.png"
        bgColor: "#00aa00"
        mouseArea.onClicked: {
            noMachineCreated ? overviewPane_Empty.visible = true: overviewPane_Normal.visible = true
            serverMallPane.visible=false
            serverProductInfoPane.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=false
            myServerIndicator.visible=true
            mallIndicator.visible=false
            diagnosisIndicator.visible=false
            sharepane.visible=false
            settingpane.visible=false
        }
        ControlModule_Indicator {
            id: myServerIndicator
            x: 135
            y: 6
            indicatorColor:"#00aa00"
            visible: true
        }
    }

    ControlModule_Button {
        id: buttonstore
        x: 57
        y: 71
        title: "伺服器商城   "
        image: "icon/ic_store_white_24dp_1x.png"
        bgColor: "#E91E63"
        mouseArea.onClicked: {
            overviewPane_Empty.visible=false
            overviewPane_Normal.visible=false
            serverMallPane.visible=true
            serverProductInfoPane.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=false
            myServerIndicator.visible=false
            mallIndicator.visible=true
            diagnosisIndicator.visible=false
            sharepane.visible=false
            settingpane.visible=false
        }
        ControlModule_Indicator {
            id: mallIndicator
            x: 135
            y: 6
            indicatorColor:"#E91E63"
            visible: false
        }
    }
    
    ControlModule_Button {
        id: buttondiagnosis
        x: 57
        y: 121
        title: qsTr("診斷              ")
        image: "icon/ic_storage_white_24dp_1x.png"
        bgColor: "#2196F3"
        mouseArea.onClicked: {
            overviewPane_Empty.visible=false
            overviewPane_Normal.visible=false
            serverMallPane.visible=false
            serverProductInfoPane.visible=false
            diagnosisPane.visible=true
            sharePane.visible=false
            settingPane.visible=false
            sharePane.visible=false
            myServerIndicator.visible=false
            mallIndicator.visible=false
            diagnosisIndicator.visible=true
            sharepane.visible=false
            settingpane.visible=false
        }
        ControlModule_Indicator {
            id: diagnosisIndicator
            x: 135
            y: 6
            indicatorColor: "#2196f3"
            visible: false
        }
    }
    
    ControlModule_Button {
        id: buttonshare
        x: 57
        y: 171
        title: qsTr("分享及備份       ")
        image: "icon/ic_share_white_24dp_1x.png"
        bgColor: "#3F51B5"
        mouseArea.onClicked: {
            overviewPane_Empty.visible=false
            overviewPane_Normal.visible=false
            serverMallPane.visible=false
            serverProductInfoPane.visible=false
            diagnosisPane.visible=false
            sharePane.visible=true
            settingPane.visible=false
            sharePane.visible=true
            myServerIndicator.visible=false
            mallIndicator.visible=false
            diagnosisIndicator.visible=false
            sharepane.visible=true
            settingpane.visible=false
        }
        ControlModule_Indicator {
            id: sharepane
            x: 135
            y: 6
            indicatorColor: "#3F51B5"
            visible: false
        }
    }
    
    ControlModule_Button {
        id: buttonsetting
        x: 57
        y: 221
        title: qsTr("偏好設定        ")
        image: "icon/ic_settings_white_24dp_1x.png"
        bgColor: "#9E9E9E"
        mouseArea.onClicked: {
            overviewPane_Empty.visible=false
            overviewPane_Normal.visible=false
            serverMallPane.visible=false
            serverProductInfoPane.visible=false
            diagnosisPane.visible=false
            sharePane.visible=false
            settingPane.visible=true
            sharePane.visible=false
            myServerIndicator.visible=false
            mallIndicator.visible=false
            diagnosisIndicator.visible=false
            sharepane.visible=false
            settingpane.visible=true
        }
        ControlModule_Indicator {
            id: settingpane
            x: 135
            y: 6
            indicatorColor:"#9e9e9e"
            visible: false
        }
    }
}
