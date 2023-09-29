import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import "../meter"

Item{
    width: 960
    height: 50

    ValueSource{
        id: valueSource
    }

    property bool egOn: valueSource.engineOn


    readonly property size telltaleSize: Qt.size(50, 50)

    anchors.horizontalCenter: parent.horizontalCenter

    Image{
        id: doorsajar
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -470
        source: "qrc:/images/doorsajar.svg"
        sourceSize: parent.telltaleSize
        visible: true

        Timer{
            interval: 6000
            running: true
            repeat: false
            onTriggered: {
                doorsajar.visible = false
            }
        }
    }
    Image{
        id: breake
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -390
        source: "qrc:/images/brakefailurered.svg"
        sourceSize: parent.telltaleSize
        visible: true

        Timer{
            interval: 6800
            running: true
            repeat: false
            onTriggered: {
                breake.visible = false
            }
        }
    }
    Image{
        id: airbag
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -310
        source: "qrc:/images/airbag.svg"
        sourceSize: parent.telltaleSize
        visible: true
        Timer{
            interval: 7200
            running: true
            repeat: false
            onTriggered: {
                airbag.visible = false
            }
        }
    }
    Image{
        id: seatbelt
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: -10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -230
        source: "qrc:/images/seatbelt.svg"
        sourceSize: parent.telltaleSize
        visible: true
        Timer{
            interval: 3200
            running: true
            repeat: false
            onTriggered: {
                seatbelt.visible = false
            }
        }
    }
}
