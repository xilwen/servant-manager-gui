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
    property bool locked: false
    property int indicatorPointer: 0
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
            indicatorPointer = 0
        }
        ControlModule_Indicator {
            id: myServerIndicator
            x: 135
            y: 6
            indicatorColor:"#00aa00"
            visible: (indicatorPointer==0)?true:false
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
            indicatorPointer = 1
        }
        ControlModule_Indicator {
            id: mallIndicator
            x: 135
            y: 6
            indicatorColor:"#E91E63"
            visible: (indicatorPointer==1)?true:false
        }
    }
    
    ControlModule_Button {
        id: buttondiagnosis
        x: 57
        y: 121
        title: qsTr("診斷              ")
        image: "icon/ic_build_white_48dp_2x.png"
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
            indicatorPointer = 2
        }
        ControlModule_Indicator {
            id: diagnosisIndicator
            x: 135
            y: 6
            indicatorColor: "#2196f3"
            visible: (indicatorPointer==2)?true:false
        }
    }
    
    ControlModule_Button {
        id: buttonshare
        x: 57
        y: 171
        title: qsTr("匯出與備份       ")
        image: "icon/ic_share_white_48dp_2x.png"
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
            indicatorPointer = 3
        }
        ControlModule_Indicator {
            id: sharepane
            x: 135
            y: 6
            indicatorColor: "#3F51B5"
            visible: (indicatorPointer==3)?true:false
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
            indicatorPointer = 4
        }
        ControlModule_Indicator {
            id: settingpane
            x: 135
            y: 6
            indicatorColor:"#9e9e9e"
            visible: (indicatorPointer==4)?true:false
        }
    }
}
