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

ApplicationWindow {
    visible: true
    width: 1024
    height: 640
    minimumWidth: 1024
    minimumHeight: 640
    objectName: "win"
    title: qsTr("SERVANT Development GUI")
    Material.accent:Material.BlueGrey
    LoadingPane
    {
        id:loadingPane
        z: 3
        visible:false
    }

    Pane {
        id: mainUIPane
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        bottomPadding: 0
        rightPadding: 0
        leftPadding: 0
        topPadding: 0
        anchors.fill: parent
        z: 2
        visible: true

        ColumnLayout {
            id: mainUILayout
            anchors.fill: parent
            spacing: 0.1

            BannerPane{
                id:bannerPane
            }

            //            SearchPane{}

            Pane {
                id: bannerborder
                width: 200
                height: 200
                Layout.fillWidth: true
                Layout.maximumHeight: 1
                visible:true
                Material.background:"#d3d3d3"
            }

            RowLayout {
                id: variableUILayout
                width: 100
                height: 100
                spacing: 0
                Layout.fillHeight: true
                Layout.fillWidth: true

                ControlPane
                {
                    id:controlPane
                }



                Pane {
                    id:  columnBorder
                    width: 200
                    height: 200
                    Layout.fillHeight: true
                    Layout.maximumWidth: 1
                    visible:true
                    Material.background:"#d3d3d3"
                }

                Pane{
                    id:opPane
                    width: 823
                    height: 579
                    bottomPadding: 0
                    rightPadding: 0
                    leftPadding: 0
                    topPadding: 0
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    OverviewPane{
                        id:overviewPane
                        visible:true
                    }

                    ServerMallPane{
                        id:serverMallPane
                        visible:false
                    }
                    ServerProductInfoPane{
                        id:serverProductInfoPane
                        visible:false
                    }
                    DiagnosisPane{
                        id:diagnosisPane
                        visible:false
                    }
                    SettingPane{
                        id:settingPane
                        visible:false
                    }

                    SharePane{
                        id:sharePane
                        visible:false
                    }

                    ServerInfoPane{
                        id: serverInfoPane
                        visible:false
                    }

                }
            }
        }
    }
    WelcomePane {
        id: welcomePane
        anchors.fill: parent
        z: 3
        visible:false
    }
    PerfMeterPane{
        id: perfMeterPane
        anchors.fill: parent
        z: 3
        visible:false
    }

    FirstTimeFinishedPane{
        id: firstTimeFinishedPane
        anchors.fill: parent
        z: 3
        visible:false
    }
}



