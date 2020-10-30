import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Page {
    Rectangle {
    id: base
    height: 500
    width: 850
    function ct2() {
        user.text = qsTr("")
    }

    function ct() {
        password.text = qsTr("")
    }


    Rectangle {
        id: window
        height:500
        width: 850


    Rectangle {
        id: leftPane
        x: 0
        y: 0
        width: 425
        height: 500
        color: "#f25d59"

        Label {
            id: dumb_display
            x: 105
            y: 232
            width: 291
            height: 71
            color: "#ffffff"
            text: qsTr("Well Come To My\nDUMB Login App")
            font.weight: Font.ExtraBold
            font.bold: true
            font.italic: true
            font.pointSize: 15
            font.family: "Times New Roman"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Image {
            id: logo
            x: 137
            y: 56
            width: 207
            height: 86
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            source: "Image.jpg"
        }
    }

    Rectangle {
        id: rightPane
        x: 425
        y: 0
        width: 425
        height: 500
        color: "#2a2d40"

        Label {
            id: login_heading
            x: 83
            y: 87
            width: 139
            height: 36
            color: "#4c4e50"
            text: qsTr("Login To Account")
            font.weight: Font.ExtraBold
            font.bold: true
            font.italic: true
            font.pointSize: 12
            font.family: "Times New Roman"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        TextArea {
            id: user
            x: 83
            y: 202
            width: 259
            height: 36
            color: "#4c4e50"
            text: "    Enter User Name"
            wrapMode: Text.WordWrap
            font.letterSpacing: 1
            font.wordSpacing: 1
            textFormat: Text.AutoText
            font.weight: Font.ExtraBold
            font.family: "Times New Roman"
            font.bold: true
            font.italic: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 15

            onPressed: {
                con.cout2()
            }

            ProgressBar {
                id: progressBar
                x: 0
                y: 35
                width: 335
                height: 1
                value: 1
            }
        }

        TextArea {
            id: password
            x: 83
            y: 260
            width: 259
            height: 36
            color: "#4c4e50"
            text: "    Password"
            font.letterSpacing: 1
            font.wordSpacing: 1
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.weight: Font.ExtraBold
            textFormat: Text.AutoText
            ProgressBar {
                id: progressBar1
                x: 0
                y: 35
                width: 335
                height: 1
                value: 1
            }


            onPressed: {
                con.cout()
            }

            font.pixelSize: 15
            font.family: "Times New Roman"
            font.italic: true
            font.bold: true
        }

        Button {
            id: btn
            x: 83
            y: 378
            width: 159
            height: 31

            background: Rectangle {
                id: bo
                implicitWidth: 159
                implicitHeight: 31
                color: "#2a2d40"
                radius: 5
                border.width: 1
                border.color: "#f25d59"

                Label {
                    id: login_lbl
                    x: 0
                    y: 0
                    width: 159
                    height: 31
                    color: "#f25d59"
                    text: qsTr("LOGIN")
                    font.bold: true
                    font.italic: true
                    font.family: "Times New Roman"
                    styleColor: "#f25d59"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter

                    background: MouseArea {
                        hoverEnabled: true
                        onPressed:  {
                            bo.border.color = "#f14641"
                            login_lbl.color = "#f14641"
                            con.authenticate(user.text, password.text)
                        }
                        onReleased:  {
                            bo.border.color =  "#f25d59"
                            login_lbl.color =  "#f25d59"
                        }
                    }
                }
            }
        }


            MouseArea {
                id: area
                x: 271
                y: 384
                width: forgot.width
                height: forgot.height
                enabled: true

                hoverEnabled: true

                Text {

                   id: forgot
                   x: 8
                   y: 0
                    color: "#4c4e50"
                    text: qsTr("Forgot Password ?")
                    font.bold: true
                    font.italic: true
                    font.underline: false
                    font.pointSize: 10
                    font.family: "Times New Roman"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                onEntered: {
                    forgot.font.underline = true
                }
                onExited: {
                    forgot.font.underline = false
                }
            }
        }
    }
    }
}
