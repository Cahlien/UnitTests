import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15

import dev.crowell.greeter 0.1
import dev.crowell.closer 0.1

import dev.crowell.UI 0.1

Window {
    id: mainWindow
    width: (Screen.width / 3) * 2
    height: (Screen.height / 3) * 2
    visible: true
    title:qsTr('UnitTests')

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
