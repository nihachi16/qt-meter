import QtQuick 2.15

Item{
    width: 960
    height: 50

    Text{
        id: clock

        property date now: new Date()
        property int hours: now.getHours()
        property int minutes: now.getMinutes()

        font.pointSize: 24


        color: "#ffffff"
        //color: "#000000"
        //text: "(^v^)v"
        text: hours.toString().padStart(2, "0") + ":" + minutes.toString().padStart(2,"0")

        Timer{
            running: true
            repeat: true
            interval: 1000

            onTriggered: clock.now = new Date()
        }

    }
}
