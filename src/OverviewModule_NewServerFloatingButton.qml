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
    id: button
    property alias imageSource: contentImage.source
    property alias backgroundColor: buttonBackground.color
    property bool showShadow: true
    Material.background: "White"
    Material.elevation:6
    contentItem:
        Item {
        implicitHeight: 24
        implicitWidth: 24
        Image {
            id: contentImage
            anchors.centerIn: parent
        }
    }
    background:
        Rectangle {
        id: buttonBackground
        implicitWidth: 56
        implicitHeight: 56
        color: "#2196F3"
        radius: width / 2
        opacity: button.pressed ? 0.75 : 1.0
        Material.elevation:6
        layer.enabled: button.showShadow
        layer.effect: {
            verticalOffset: 3
            horizontalOffset: 1
            //color: dropShadow
            samples: button.pressed ? 20 : 10
            spread: 0.5
        }
    }
}
