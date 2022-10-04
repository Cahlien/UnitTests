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
        }
    }

    TestCase {
        name: "ConstructorTest"
        when: windowShown

        function test_HelloWorldConstructor() {

            var helloWorld = testItem.testComponent
            waitForRendering(testItem, 1000)
            verify(helloWorld.mainText === "Hello World!")
        }

        function init() {
            testLoader.active = false
            testLoader.active = true
        }
    }
}
