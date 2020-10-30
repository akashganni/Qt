import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

Page {
    id: basepage
    width: 950
    height: 600

    Rectangle {
        id: sideBar
        x: 0
        y: 0
        width: 218
        height: 600
        color: "#495468"

        Label {
            id: label
            x: 8
            y: 14
            width: 133
            height: 42
            color: "#a8a8a8"
            text: qsTr("Urban")
            font.bold: false
            font.italic: true
            font.family: "Verdana"
            font.pointSize: 25
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Rectangle {
            id: rectangle3
            x: 8
            y: 83
            width: 145
            height: 33
            color: "#495468"
        }

        Image {
            id: image
            x: 13
            y: 86
            width: 35
            height: 28
            fillMode: Image.PreserveAspectFit
            source: "Icons/twitter.png"
        }

        Label {
            id: label2
            x: 54
            y: 88
            width: 87
            height: 24
            color: "#111111"
            text: qsTr("Statistics")
            wrapMode: Text.WrapAnywhere
            font.italic: true
            font.pointSize: 12
            font.family: "Verdana"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }
    }

    Rectangle {
        id: home
        x: 219
        y: 0
        width: 831
        height: 600
        color: "#ffffff"

        Rectangle {
            id: rectangle
            x: 0
            y: 0
            width: 831
            height: 53
            color: "#ffffff"

            Label {
                id: label1
                x: 8
                y: 14
                width: 108
                height: 26
                color: "#a8a8a8"
                text: qsTr("Dashboard")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Rectangle {
            id: rectangle1
            x: 0
            y: 59
            width: 737
            height: 0
            color: "#ffffff"
        }

        Rectangle {
            id: rectangle2
            x: 0
            y: 53
            width: 831
            height: 547
            color: "#f0f0f0"
        }
    }
}
