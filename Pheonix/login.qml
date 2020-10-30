import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

Page {
    id: base_page
    width: 950
    height: 600

    function check() {
        console.log("login")
    }

    function checkPassword(source, check) {
        passwordcheckimage.source = source
        if (check === 0) {passwordcheckimage.visible = false}
        else if(check === 1) {passwordcheckimage.visible = true}
    }

    function checkUser(source, check) {
        emailocheckimage.source = source
        if (check === 0) {emailocheckimage.visible = false}
        else if(check === 1) {emailocheckimage.visible = true}
    }

    Rectangle {
        id: holder
        x: 0
        y: 0
        width: 502
        height: 600
        color: "#ffffff"

        Image {
            id: image
            x: 0
            y: 25
            width: 438
            height: 493
            fillMode: Image.PreserveAspectFit
            source: "Icons/backfround_img.jpg"
        }
    }

    Rectangle {
        id: form
        x: 502
        y: 0
        width: 448
        height: 600
        color: "#ffffff"

        Text {
            id: heading1
            x: 65
            y: 44
            width: 202
            height: 63
            color: "#282424"
            text: qsTr("Welcome Back")
            layer.textureMirroring: ShaderEffectSource.NoMirroring
            font.bold: false
            font.italic: false
            font.family: "Verdana"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 26
        }

        Text {
            id: heading2
            x: 65
            y: 120
            width: 147
            height: 38
            text: qsTr("  Login")
            font.bold: false
            font.italic: false
            font.family: "Verdana"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
            font.pixelSize: 20
        }



        Rectangle {
            id: emailform
            x: 46
            y: 179
            width: 330
            height: 64
            color: "#ffffff"

            Image {
                id: emailIcon
                x: 8
                y: 10
                width: 45
                height: 45
                fillMode: Image.PreserveAspectFit
                source: "Icons/emailIcon.png"
            }

            TextField {
                id: userField
                x: 67
                y: 25
                property var n: 0
                width: 228
                height: 30
                text: qsTr("")
                placeholderText: "eg: abcdef@ghi.com"

                background: Rectangle {
                    id: userFieldBackground
                    x: 0
                    y: 0
                    width: userField.width
                    height: userField.height
                    color: "#ffffff"
                }

                onFocusChanged:    {
                    if (userField.n == 0) {
                        userFieldBackground.color = "#d1d4d9"
                        emailform.color = "#d1d4d9"
                        userField.n = 1
                    }
                    else {
                        userFieldBackground.color = "#ffffff"
                        emailform.color = "#ffffff"
                        userField.n = 0
                    }
                }
            }



            Label {
                id: emaillabel
                x: 67
                y: 8
                width: 93
                height: 17
                text: qsTr("  Email Adress")
                font.family: "Verdana"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }

            Page {
                id: emailcheck
                x: 298
                y: 19
                width: 20
                height: 20
                background: Image {
                    visible: false
                    id: emailocheckimage
                    x: 0
                    y: 0
                    width: 20
                    height: 20
                    source: "Icons/wrong.png"
                    fillMode: Image.PreserveAspectFit

                }
            }
        }



        Rectangle {
            id: passwordform
            x: 46
            y: 268
            width: 330
            height: 64
            color: "#ffffff"
            Image {
                id: lockIcon
                x: 8
                y: 10
                width: 45
                height: 45
                source: "Icons/lock.png"
                fillMode: Image.PreserveAspectFit
            }

            TextField {
                id: passwordField
                x: 67
                y: 26
                width: 226
                height: 30
                property var n: 0
                text: qsTr("")
                placeholderText: qsTr("eg: (P#e@nix)")

                background: Rectangle {
                    id: passwordFieldBackground
                    x: 0
                    y: 0
                    width: passwordField.width
                    height: passwordField.height
                    color: "#ffffff"
                }

                onFocusChanged:   {
                    if (passwordField.n == 0) {
                        passwordFieldBackground.color = "#d1d4d9"
                        passwordform.color = "#d1d4d9"
                        passwordField.n = 1
                    }
                    else {
                        passwordFieldBackground.color = "#ffffff"
                        passwordform.color = "#ffffff"
                        passwordField.n = 0
                    }
                }
            }

            Label {
                id: loginlabel1
                x: 67
                y: 8
                width: 93
                height: 17
                text: qsTr("  Password")
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                font.family: "Verdana"
            }

            Page {
                id: passwordcheck
                x: 298
                y: 19
                width: 20
                height: 20
                background: Image {
                    visible: false
                    id: passwordcheckimage
                    x: 0
                    y: 0
                    width: 20
                    height: 20
                    source: "Icons/wrong.png"
                    fillMode: Image.PreserveAspectFit

                }
            }
        }

        Rectangle {
            id: rectangle
            x: 46
            y: 345
            width: 139
            height: 26
            color: "#ffffff"

            Page {
                id: page
                x: 0
                y: 0
                width: 20
                height: 20

                background: MouseArea {
                    x: 0
                    y: 0
                    width: 20
                    height: 20
                    onClicked: {
                        if (remembermeicon.n == 0) {
                            remembermeicon.source = "Icons/ok.png"
                            remembermeicon.n = 1
                        }
                        else {
                            remembermeicon.source = "Icons/circle.png"
                            remembermeicon.n = 0
                        }
                    }
                }
            }

            Image {
                id: remembermeicon
                property var n: 0
                x: 0
                y: 0
                width: 20
                height: 20
                anchors.verticalCenter: parent.verticalCenter
                source: "Icons/circle.png"
                fillMode: Image.PreserveAspectFit

            }

            Label {
                x: 26
                y :26
                width: 105
                height: 26
                text: "Remember Me"
                font.family: "Verdana"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
                anchors.verticalCenter: parent.verticalCenter
                id: remembermelabel
            }
        }

        Rectangle {
            x: 276
            y: 345
            width: 100
            height: 26
            Label {
                id: forgotpasswordlabel
                x: 0
                y: 0
                width: 100
                height: 26
                font.underline: false
                color: "#4c4e50"
                text: qsTr("Forgot Password")
                font.family: "Verdana"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea {
                x: 0
                y: 0
                width: 100
                height: 10
                enabled: true
                hoverEnabled: true
                anchors.centerIn: parent
                onEntered: {
                    forgotpasswordlabel.font.underline = true
                }
                onExited: {
                    forgotpasswordlabel.font.underline = false
                }
            }
        }

        Rectangle {
            x: 227
            y: 396
            width: 100
            height: 26
            Label {
                id: createaccountlabel
                x: 0
                y: 0
                width: 100
                height: 26
                font.underline: false
                color: "#4c4e50"
                text: qsTr("Create Account")
                font.family: "Verdana"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
            MouseArea {
                x: 0
                y: 0
                width: 100
                height: 10
                enabled: true
                hoverEnabled: true
                anchors.centerIn: parent
                onEntered: {
                    createaccountlabel.font.underline = true
                }
                onExited: {
                    createaccountlabel.font.underline = false
                }
                onClicked: {
                    //var i
                    //for(i=5; i< 503; i=i+0.5){
                    //    holder.x = i
                    //    form.x = 502-i
                    //    if (holder.x == form.x) {
                    //        holder.visible = false
                    //       form.visible = false
                    //    }
                    //}
                    con.check()
                }
            }
        }

        Page {
            x: 34
            y: 391
            width: 139
            height: 36
            Rectangle {
                id: btnHolder
                x: 0
                y: 0
                width: 139
                height: 36
                color: "#37a1f5"
                radius: 18
                border.width: 0

                Label {
                    color: "#ffffff"
                    text: qsTr("Login Now")
                    font.family: "verdona"
                    font.pixelSize: 15
                    anchors.centerIn: parent
                }
            }
            background: Button {
                id: btn
                width: 125
                height: 25
                anchors.centerIn: parent

                onClicked: {
                    con.authenticate()
                }
            }
        }

        Label {
            id: label
            x: 34
            y: 455
            width: 127
            height: 17
            color: "#4c4e50"
            text: qsTr("Or you can join with")
            font.family: "Verdana"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Image {
            id: google
            x: 46
            y: 495
            width: 40
            height: 34
            source: "Icons/google.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: facebook
            x: 101
            y: 488
            width: 46
            height: 49
            source: "Icons/facebook.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: facebook1
            x: 160
            y: 491
            width: 52
            height: 42
            source: "Icons/twitter.png"
            fillMode: Image.PreserveAspectFit
        }
    }
}

/*##^##
Designer {
    D{i:33;anchors_height:25;anchors_width:120;anchors_x:0;anchors_y:0}
}
##^##*/
