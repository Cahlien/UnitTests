import QtQuick 2.15
import QtTest 1.2

import dev.crowell.UI

Item {
    id: testItem

    property alias testComponent: testLoader.item

    Loader {
        id: testLoader
        sourceComponent: testComponent
    }

    Component {
        id: testComponent

        HelloWorld {
            id: helloWorld
            mainText: "Hello World!"
            property alias buttonSpy: spy

            SignalSpy {
                id: spy
                target: helloWorld
                signalName: "close"
            }
        }
    }

    TestCase {
        name: "HelloWorld"
        when: windowShown

        function test_HelloWorldConstructor() {

            var helloWorld = testItem.testComponent
            verify(helloWorld !== null && helloWorld !== undefined)
        }

        function test_HelloWorldText() {

            var helloWorld = testItem.testComponent
            verify(helloWorld.mainText === "Hello World!")
        }

        function test_HelloWorldTextChange() {

            var helloWorld = testItem.testComponent
            helloWorld.mainText = "Hello World Again!"
            verify(helloWorld.mainText === "Hello World Again!")
        }

        function test_HelloWorldButtonPressed() {

            var button = testItem.testComponent.mainButton
            var buttonSpy = testItem.testComponent.buttonSpy

            mouseClick(button, button.width / 2, button.height / 2, Qt.LeftButton, Qt.NoModifier, -1)

            buttonSpy.wait()

            compare(buttonSpy.count, 1)
        }

        function init() {
            testLoader.active = false
            testLoader.active = true
        }
    }
}