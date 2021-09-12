import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Page {
    width: parent
    height: parent

    font.family: "Roboto"
    title: width > 400 ? qsTr("Демо с фигурами") : qsTr("")

    Rectangle {
        id: help
        width: parent.width / 1.5
        height: parent.width > 500 ? 64 : 128
        anchors.top: parent.top
        anchors.topMargin: 32
        anchors.right: parent.right
        anchors.rightMargin: 32
        radius: 15
        border.color: "#B9D9BE"
        border.width: 1
        color: "#E2FFC9"

        Label {
            height: parent.height
            width: parent.width - 64

            font.family: "Roboto"
            text: qsTr("Нажмите справа вверху для создания геометрических фигур, снизу кнопка очищает структуру объектов. Слева гамбургер меню чтобы узнать об авторе.")
            wrapMode: Text.WordWrap
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.width > 500 ? 16 : 4
        }

        OpacityAnimator {
            target: help
            from: 0
            to: 1
            duration: 1000
            running: true
        }
    }
}
