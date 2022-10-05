import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root

    property alias mainText: mainWindowText.text
    property var greeter: null
    property var closer: null
    property alias mainButton: closeButton

    signal close()

    onClose: {
        closer != null ? closer.close() : alert("No closer set")
    }

    Rectangle {
        id: mainWindowBackground
        color: '#000000'
        anchors.fill: parent
    }

    Text {
        id: mainWindowText
        color: '#FFFFFF'
        anchors.centerIn: parent
        text: qsTr(greeter ? greeter.greet() : "Hello World!")
        font.pointSize: 72
    }

    Button {
        id: closeButton
        height: 75
        width: 150
        background: Rectangle {
            color: '#C4C4C4'

            anchors {
                fill: parent
            }
        }
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: mainWindowText.bottom
            topMargin: 50
        }

        text: qsTr('Close')
        onClicked: root.close()
    }
}