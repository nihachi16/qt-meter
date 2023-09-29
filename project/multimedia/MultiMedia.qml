import QtQuick 2.15

Item{
    width: 350
    height: 250

    property Component media_delegate: MediaDelegate{}
    property MediaModel media_model: MediaModel{}

    ListView{
        anchors.fill: parent

        snapMode: ListView.SnapToItem
        clip: true

        delegate: media_delegate
        model: media_model
    }

}
