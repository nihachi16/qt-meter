import QtQuick 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

Item{
    width: 400
    height: 400

    ValueSource{
        id: valueSource
    }
    property bool egOn: valueSource.engineOn

    RowLayout{

        CircularGauge{
            id: tacho

            value: valueSource.rpm
            maximumValue: 10
            minimumValue: 0

            Behavior on value {
                PropertyAnimation{
                    duration: 500
                    easing.type: Easing.Linear
                }
            }

            style: CircularGaugeStyle{
                function degreesToRadians(degrees){
                    return degrees * (Math.PI / 180);
                }

    //            background: Canvas{
    //                onPaint: {
    //                    var ctx = getContext("2d");
    //                    ctx.reset();

    //                    ctx.begimPath();
    //                    ctx.strokeStyle = "e34c22";
    //                    ctx.lineWidth = outerRadius * 0.02;

    //                    ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2, degreesToRadians(valueToAngle(7)-90), degreesToRadians(valueToAngle(10)-90));
    //                    ctx.stroke();
    //                }
    //            }
                background: Item {
                    implicitHeight: 400
                    implicitWidth: 400

                    Rectangle{
                        anchors.fill: parent
                        height: implicitHeight * 1.1
                        width: implicitWidth * 1.1
                        radius: width / 2
                        border.width: 4
                        border.color: "#eeeeff"
                    }
                    Rectangle{
                        anchors.fill: parent
                        radius: width / 2
                        color: "#000220"
                        border.width: 3
                        border.color: "#002299"
                    }

                    Rectangle{
                        id: bow
                        anchors.centerIn: parent
                        width: parent.width * 0.6
                        height: parent.height * 0.6
                        radius: width / 2
                        RadialGradient{
                            anchors.fill: parent
                            gradient: Gradient{
                                GradientStop{
                                    position: 0
                                    color: "#0022bb"
                                }
                                GradientStop{
                                    position: 0.3
                                    color: "#0022bb"
                                }
                                GradientStop{
                                    position: 0.5
                                    color: "#000220"
                                }
                                GradientStop{
                                    position: 1
                                    color: "#000220"
                                }
                            }
                        }


                        opacity: 1
                    }
                }

                tickmarkStepSize: 1
                tickmark:Rectangle{
                     height: outerRadius * 0.05
                     width: outerRadius * 0.02
                     color: styleData.index >= 7 ? "#e34c22" : "#e5e5e5"
                }
                minorTickmark:Rectangle{
                     height: outerRadius * 0.02
                     width: outerRadius * 0.01
                     color: styleData.value >= 7 ? "#e34c22" : "#e5e5e5"
                }
                tickmarkLabel: Text{
                    font.pixelSize: 30
                    font.italic: true
                    font.bold: true
                    text: styleData.index
                    color:styleData.index >= 7 ? "#e34c22" : "#e5e5e5"
                }


                foreground: Rectangle{
                    width: outerRadius * 0.9
                    height: width
                    radius: width / 2
                    color: "#000000"
                    anchors.centerIn: parent
                }
            }

            readonly property size telltaleSize: Qt.size(40, 40)
            Image{
                id:engine
                anchors.verticalCenter: tacho.verticalCenter
                anchors.verticalCenterOffset: -24
                anchors.horizontalCenter: tacho.horizontalCenter
                anchors.horizontalCenterOffset: -30
                source: "qrc:/images/engine.svg"
                sourceSize: parent.telltaleSize

                Timer{
                    interval: 1400
                    running: true
                    repeat: true
                    onTriggered: {
                        if(egOn){
                            engine.source = "qrc:/images/black.svg"
                        }else{
                            engine.source = "qrc:/images/engine.svg"
                        }
                    }
                }
            }
            Image{
                id: battery
                anchors.verticalCenter: tacho.verticalCenter
                anchors.verticalCenterOffset: 24
                anchors.horizontalCenter: tacho.horizontalCenter
                anchors.horizontalCenterOffset: -30
                source: "qrc:/images/battery.svg"
                sourceSize: parent.telltaleSize
                Timer{
                    interval: 1360
                    running: true
                    repeat: true
                    onTriggered: {
                        if(egOn){
                            battery.source = "qrc:/images/black.svg"
                        }else{
                            battery.source = "qrc:/images/battery.svg"
                        }
                    }
                }
            }
            Image{
                id: oil
                anchors.verticalCenter: tacho.verticalCenter
                anchors.verticalCenterOffset: -24
                anchors.horizontalCenter: tacho.horizontalCenter
                anchors.horizontalCenterOffset: 30
                source: "qrc:/images/engineoil.svg"
                sourceSize: parent.telltaleSize
                Timer{
                    interval: 1200
                    running: true
                    repeat: true
                    onTriggered: {
                        if(egOn){
                            oil.source = "qrc:/images/black.svg"
                        }else{
                            oil.source = "qrc:/images/engineoil.svg"
                        }
                    }
                }
            }
            Image{
                id: steering
                anchors.verticalCenter: tacho.verticalCenter
                anchors.verticalCenterOffset: 24
                anchors.horizontalCenter: tacho.horizontalCenter
                anchors.horizontalCenterOffset: 30
                source: "qrc:/images/steeringfailure.svg"
                sourceSize: parent.telltaleSize
                Timer{
                    interval: 1340
                    running: true
                    repeat: true
                    onTriggered: {
                        if(egOn){
                            steering.source = "qrc:/images/black.svg"
                        }else{
                            steering.source = "qrc:/images/steeringfailure.svg"
                        }
                    }
                }
            }
            Text {
                font.pixelSize: 24
                text: "x1000rpm"
                color: "#ffffff"
                font.italic: true
                font.bold: true
                anchors.top: tacho.bottom
                anchors.topMargin: -52
                anchors.horizontalCenter: tacho.horizontalCenter
            }

        }

        CircularGauge{
            id: speed

            Layout.leftMargin: 300

            value: valueSource.tempkph
            maximumValue: 240
            minimumValue: 0

            Behavior on value {
                PropertyAnimation{
                    duration: 500
                    easing.type: Easing.Linear
                }
            }

            style: CircularGaugeStyle{

                labelStepSize: 20

                background: Item {
                    implicitHeight: 400
                    implicitWidth: 400

                    Rectangle{
                        anchors.fill: parent
                        height: implicitHeight * 1.1
                        width: implicitWidth * 1.1
                        radius: width / 2
                        border.width: 4
                        border.color: "#eeeeff"
                    }
                    Rectangle{
                        anchors.fill: parent
                        radius: width / 2
                        color: "#000220"
                        border.width: 3
                        border.color: "#002299"
                    }

                    Rectangle{
                        id: bow2
                        anchors.centerIn: parent
                        width: parent.width * 0.6
                        height: parent.height * 0.6
                        radius: width / 2
                        RadialGradient{
                            anchors.fill: parent
                            gradient: Gradient{
                                GradientStop{
                                    position: 0
                                    color: "#0022bb"
                                }
                                GradientStop{
                                    position: 0.3
                                    color: "#0022bb"
                                }
                                GradientStop{
                                    position: 0.5
                                    color: "#000220"
                                }
                                GradientStop{
                                    position: 1
                                    color: "#000220"
                                }
                            }
                        }


                        opacity: 1
                    }
                }

                tickmarkStepSize: 10
                tickmark:Rectangle{
                     height: outerRadius * 0.05
                     width: outerRadius * 0.02
                     color: "#e5e5e5"
                }
                minorTickmark:Rectangle{
                     height: outerRadius * 0.02
                     width: outerRadius * 0.01
                     color: "#e5e5e5"
                }
                tickmarkLabel: Text{
                    font.pixelSize: 30
                    font.italic: true
                    font.bold: true
                    text: styleData.value
                    color: "#e5e5e5"
                }


                foreground: Rectangle{
                    width: outerRadius * 0.9
                    height: width
                    radius: width / 2
                    color: "#000000"
                    anchors.centerIn: parent
                }
            }
            Text {
                id: speedValue

                property int spdVal: valueSource.kph
                font.pixelSize: 80
                text: spdVal
                color: "#ffffff"
                font.italic: true
                font.bold: true
                font.kerning: false
                anchors.centerIn: speed

                Behavior on spdVal {
                    PropertyAnimation{
                        duration: 500
                        easing.type: Easing.Linear
                    }
                }
            }
            Text {
                font.pixelSize: 24
                text: "km/h"
                color: "#ffffff"
                font.italic: true
                font.bold: true
                anchors.top: speed.bottom
                anchors.topMargin: -52
                anchors.horizontalCenter: speed.horizontalCenter
            }
        }
        CircularGauge{
            id: fuelGauge
            Layout.leftMargin: -540
            Layout.topMargin: -300

            maximumValue: 40
            property real fuelSource: valueSource.fuel

            value: fuelSource

            style: CircularGaugeStyle{



                labelStepSize: 10

                minimumValueAngle: -60
                maximumValueAngle: 60

                //tickmarkStepSize: 10
                tickmark:Rectangle{
                     height: outerRadius * 0.1
                     width: outerRadius * 0.05
                     color: "#e5e5e5"
                }
                minorTickmark:Rectangle{
                     height: outerRadius * 0.1
                     width: outerRadius * 0.05
                     color: "#e5e5e5"
                     visible: false
                }
                tickmarkLabel: Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 10
                    font.pixelSize: 20
                    font.italic: true
                    font.bold: true
                    text: styleData.value === 0 ? "E" : (styleData.value === 40 ? "F" : "")
                    color: "#e5e5e5"
                }
                background: Item {
                    readonly property size telltaleSize2: Qt.size(40, 40)
                    readonly property size telltaleSize3: Qt.size(30, 30)
                    implicitHeight: 140
                    implicitWidth: 140

                    Rectangle{
                        anchors.fill: parent
                        height: implicitHeight * 1.1
                        width: implicitWidth * 1.1
                        radius: width / 2
                        border.width: 4
                        border.color: "#eeeeff"
                    }
                    Rectangle{
                        anchors.fill: parent
                        radius: width / 2
                        color: "#000220"
                        border.width: 3
                        border.color: "#002299"
                    }

                    Image {
                        id: fuellid
                        source: "qrc:/images/fuellid.svg"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset: -32
                        anchors.horizontalCenter: parent.horizontalCenter
                        sourceSize: parent.telltaleSize3
                    }
                    Image {
                        id: fuelLevel
                        source: ""
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset: 32
                        anchors.horizontalCenter: parent.horizontalCenter
                        sourceSize: parent.telltaleSize2
//                        visible: false
                        Timer{
                            interval: 1000
                            running: true
                            repeat: true
                            onTriggered: {
                                if(fuelGauge.fuelSource < 5 ){
                                    fuelLevel.source = "qrc:/images/fuel.svg"
                                }
                            }
                        }
                    }


                }
            }
        }

        CircularGauge{
            id: coolanttemp
            Layout.leftMargin: -720
            Layout.topMargin: -300

            maximumValue: 40
            property real tempSource: valueSource.tempu

            value: tempSource

            style: CircularGaugeStyle{



                labelStepSize: 10

                minimumValueAngle: -60
                maximumValueAngle: 60

                //tickmarkStepSize: 10
                tickmark:Rectangle{
                     height: outerRadius * 0.1
                     width: outerRadius * 0.05
                     color: "#e5e5e5"
                }
                minorTickmark:Rectangle{
                     height: outerRadius * 0.1
                     width: outerRadius * 0.05
                     color: "#e5e5e5"
                     visible: false
                }
                tickmarkLabel: Text{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 10
                    font.pixelSize: 20
                    font.italic: true
                    font.bold: true
                    text: styleData.value === 0 ? "L" : (styleData.value === 40 ? "H" : "")
                    color: "#e5e5e5"
                }
                background: Item {
                    readonly property size telltaleSize2: Qt.size(40, 40)
                    implicitHeight: 140
                    implicitWidth: 140

                    Rectangle{
                        anchors.fill: parent
                        height: implicitHeight * 1.1
                        width: implicitWidth * 1.1
                        radius: width / 2
                        border.width: 4
                        border.color: "#eeeeff"
                    }
                    Rectangle{
                        anchors.fill: parent
                        radius: width / 2
                        color: "#000220"
                        border.width: 3
                        border.color: "#002299"
                    }

                    Image {
                        id: coolanttempicon
                        source: "qrc:/images/enginecoolanttemplow.svg"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.verticalCenterOffset: 32
                        anchors.horizontalCenter: parent.horizontalCenter
                        sourceSize: parent.telltaleSize2
                        visible: true
                        Timer{
                            interval: 1000
                            running: true
                            repeat: true
                            onTriggered: {
                                if(coolanttemp.tempSource < 9){
                                    coolanttempicon.source = "qrc:/images/enginecoolanttemplow.svg"
                                }else if(coolanttemp.tempSource > 37){
                                    coolanttempicon.source = "qrc:/images/enginecoolanttemphigh.svg"
                                }else{
                                    coolanttempicon.source = "qrc:/images/black.svg"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
