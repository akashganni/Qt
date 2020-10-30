import QtQuick 2.2
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

Page {
	id: base
    width: 950
    height: 600

    function change () {
        console.log("from trainer")
        loader.push("home.qml")
    }

    StackView {
        id: loader
        initialItem: "login.qml"
    }
}
