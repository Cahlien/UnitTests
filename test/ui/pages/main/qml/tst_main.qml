import QtQuick 2.15
import QtTest 1.2

//import ui 1.0 as UI
//import MyComponents 1.0
import "file:/C:/Users/Matth/CLionProjects/UnitTests/cmake-build-debug/UnitTests/ui/pages/"

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

//TestCase {
//    name: "MainPageTests"
//    when: windowShown
//
//    Item {
//        id: root
//
//        QtObject {
//            id: application
//            property bool desktopMode: true
//        }
//
//        Component {
//            id: helloWorld
//
//            HelloWorld {
//                id: helloWorld
//            }
//        }
//    }
//
//    function test_closeMainPage() {
//    // TODO: refactor main.qml to use a component with aliases that expose subcomponents
////        mainPage = Qt.createQmlObject("import QtQuick 2.15; Rectangle {id: mainPage; width: 100; height: 100; color: 'red'; property alias title: title.text; Text {id: title; text: qsTr('My Title');}}", window)
//          mainPage = Qt.createComponent("hello_world.qml")
//
//          if(mainPage.status == Component.Ready) {
//            finalize();
//          } else {
//            mainPage.statusChanged.connect(finalize);
//          }
//
//        print("mainPage.status: " + mainPage.toString())
//
//        compare(mainPage.mainText, "1")
//    }
//
//    function finalize() {
//        if(mainPage.status == Component.Ready) {
//          mainWindow = mainPage.createObject(window, {"x": 100, "y": 100})
//
//          if(mainWindow == null) {
//              console.log("Error creating object")
//          }
//        } else {
//          console.log("Error loading component:", mainPage.errorString())
//        }
//    }
//}
