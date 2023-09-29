import QtQuick 2.15

Item{
    id: valueSource

    property bool engineOn: false
//    property int safestart: 0
    property bool isAccelerated: false
    property real rpm: 0
    property int kph: 0
    property real fuel: 40
    property real tempu: 0
    property real tempkph: 0.0
    readonly property int maxRpm: 10
    property int minRpm: 0
    readonly property int maxKph: 240
    readonly property int minKph: 0
    readonly property int kpm1st: 20
    readonly property int kpm2nd: 40
    readonly property int kpm3rd: 50
    readonly property int kpm4th: 60
    readonly property int kpm5th: 80
    readonly property int kpm6th: 100


    function accelerate(){
        if (rpm < maxRpm){
            rpm += ((8.5 - rpm) * 0.025)
            fuel -= rpm*0.001
            tempu += 0.02
        }else{
            rpm = maxRpm
        }
        if(kph < maxKph){
            tempkph += ((maxKph-kph)*(maxKph-kph)*((11-rpm)*(11-rpm)*0.3)*0.000005)
            kph = tempkph
        }else{
            kph = maxKph
        }
    }



    function decelerate(){
        if (minRpm < rpm){
            rpm -= (rpm*rpm*0.03)
        }else{
            rpm = minRpm
        }
        if(minKph < kph){
            tempkph -= tempkph*0.002
            kph = tempkph
        }else{
            kph = minKph
        }
    }

    Timer{
        interval: 100;
        running: true
        repeat: true;
        onTriggered: {
            if(isAccelerated)
                accelerate();
            else
                decelerate();
                fuel -= rpm*0.001
                if(tempu < 18 && egOn){
                    tempu += 0.01
                }else if(tempu > 24){
                    tempu -= 0.01
                }
        }
    }

    Timer{
        id: safestart
        interval: 100
        repeat: false

        onTriggered: {
            if(rpm > 1.1){
                rpm -= rpm*0.02
                safestart.start();
                //print(rpm)
            }
        }
    }

    focus: true

    Keys.onPressed: {
        if(event.key === Qt.Key_A && engineOn){
            isAccelerated = true;
        }else if(event.key === Qt.Key_A && !engineOn){
            engineOn = true
            print(engineOn)
            rpm = 3
            minRpm = 1
            safestart.start();
        }
    }

    Keys.onReleased: {
        if(event.key === Qt.Key_A){
            isAccelerated = false;

        }
    }
}
