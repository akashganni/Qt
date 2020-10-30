import QtQuick 2.9
import QtQuick.Window 2.9
import QtQuick.Controls 2.9

Page {
    width: 950
    height: 600

    function change(so) {
        loader.source = so
    }

    function checkPassword(source, check) {
        login.checkPassword(source, check)
    }

    function checkUser(source, check) {
        login.checkUser(source, check)
    }

    Loader {
        id: loader
        source: "Login.qml"
    }

    Login {
        id: login
    }

    Home {
        id: home
    }
}
