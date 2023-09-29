import QtQuick 2.15
import QtQuick.Layouts 1.15

Item{
    required property url img_path
    required property string title

    width: 350
    height: 350

    ColumnLayout{
        anchors.centerIn: parent
        spacing: 0

        Image{
            Layout.alignment: Qt.AlignHCenter
            source: img_path
            sourceSize: Qt.size(150, 150)
        }
        Text{
            Layout.alignment:Qt.AlignHCenter
            text: title
            font.pointSize: 24
        }
    }
}
