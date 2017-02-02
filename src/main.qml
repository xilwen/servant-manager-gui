import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Material 2.0


ApplicationWindow {
    visible: true
    width: 1024
    height: 640
    minimumWidth: 1024
    minimumHeight: 640
    objectName: "win"
    title: qsTr("SERVANT Development GUI")
    
    LoadingPane{
        id:loadingPane
        z: 3
    }

    Pane {
        id: mainUIPane
        bottomPadding: 0
        rightPadding: 0
        leftPadding: 0
        topPadding: 0
        anchors.fill: parent
        z: 2
        visible: true
        Material.theme: Material.Light
        Material.accent: Material.Blue
        ColumnLayout {
            id: mainUILayout
            anchors.fill: parent
            spacing: 0.1
            
            BannerPane{
                id:bannerPane
            }
            
            Pane {
                id: bannerborder
                width: 200
                height: 200
                Layout.fillWidth: true
                Layout.maximumHeight: 1
                Material.background:"#d3d3d3"
            }
            
            RowLayout {
                id: variableUILayout
                width: 100
                height: 100
                spacing: 0
                Layout.fillHeight: true
                Layout.fillWidth: true
                
                ControlPane{
                    id:controlPane
                }
                
                Pane {
                    id: columnBorder
                    width: 200
                    height: 200
                    Layout.fillHeight: true
                    Layout.maximumWidth: 1
                    Material.background:"#d3d3d3"
                }
                
                Pane {
                    id: opPane
                    width: 200
                    height: 200
                    bottomPadding: 0
                    rightPadding: 0
                    leftPadding: 0
                    topPadding: 0
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    
                    ServerInfoPane{
                        id:serverInfoPane
                        visible:false
                    }
                    
                    OverviewPane{
                        id:overviewPane
                    }
                    
                    ImportPane{
                        id:importPane
                        visible:false
                    }

                    ServerMall{
                        id: serverMallPane
                        visible:false
                    }

                    ServerProductInfoPane{
                        id: serverProductInfoPane
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
