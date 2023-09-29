import QtQuick 2.15
import QtQuick.Window 2.15

import "qrc:/qml/footer"
import "qrc:/qml/header"
import "qrc:/qml/multimedia"
import "qrc:/qml/meter"

Window {
    id: window
    width: 1260
    height: 550
    visible: true
    color: "#000000"
    title: qsTr("sample")

    Rectangle{
        width: window.width
        height: window.height
        anchors.verticalCenter: parent.verticalCenter
        gradient: Gradient{
            GradientStop{
                position: 0.3
                color: "#000000"
            }
            GradientStop{
                position: 1
                color: "#002244"
            }
        }
    }

    Header{}
    Meter{
        x:80
        anchors.verticalCenter: parent.verticalCenter
    }
    MultiMedia{
        x:450
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 60
    }
//    ValueSource{
//        id: valueSource
//    }

    Footer{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
//        valueSource: valueSource
    }
}
