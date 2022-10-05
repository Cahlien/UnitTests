import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

import dev.crowell.test.greeter 0.1
import dev.crowell.test.closer 0.1

import "qrc:/ui/pages/"

Window {
    id: mainWindow
    width: 1280
    height: 720
    visible: true
    title:qsTr('UnitTests')

    Connections {
        target: helloWorld
        function onClose() {
            closer.close()
        }
    }

    HelloWorld {
        id: helloWorld
        anchors.fill: parent

        greeter: Greeter {
            id: greeter
        }

        closer: Closer {
            id: closer
        }
    }

    Component.onCompleted: {
        x = screen.virtualX + ((screen.width - width) / 2)
        y = screen.virtualY + ((screen.height - height) / 2)
    }
}
