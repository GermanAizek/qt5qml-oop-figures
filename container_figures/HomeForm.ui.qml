import QtQuick 2.15
import QtQuick.Controls 2.15

Page {
    width: parent
    height: parent

    title: qsTr("Демо с фигурами")

    Label {
        text: qsTr("Нажмите справа вверху для создания геометрических фигур, снизу кнопка очищает структуру объектов.")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 32
    }
}
