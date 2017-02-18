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


Button {
    id:  overviewModuleServerQuickAction
    width: 345
    height: 84
    Material.background: "White"

        Button {
            id: button1
            x: 0
            width: 345
            height: 47
            anchors.top: parent.top
            anchors.topMargin: 71
            Material.background: "White"
        }

        Image {
            id: image
            y: 6
            width: 68
            height: 68
            anchors.left: parent.left
            anchors.leftMargin: 8
            source: "icon/ic_folder_black_48dp_2x.png"
        }
}


