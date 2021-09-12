import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

Page {
    width: parent
    height: parent

    font.family: "Roboto"
    title: width > 150 ? qsTr("Обо мне") : qsTr("")

    Rectangle {
        width: parent.width
        height: parent.height
        color: "black"

        AnimatedImage {
            id: animation
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            source: "images/back.gif"
            OpacityAnimator {
                target: animation
                from: 1
                to: 0
                duration: 30000
                running: true
            }
        }

        AnimatedImage {
            id: animation2
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            source: "images/back2.gif"
            OpacityAnimator {
                target: animation2
                from: 0
                to: 1
                duration: 30000
                running: true
            }
        }
    }

    Rectangle {
        id: rect
        width: parent.width / 2
        height: parent.height / 1.5
        anchors.centerIn: parent
        anchors.margins: 10
        radius: 10
        color: "#DFE2EB"
        visible: parent.height > 200 ? true : false

        Rectangle {
            id: quest
            width: parent.width / 1.5
            height: 64
            anchors.top: parent.top
            anchors.topMargin: parent.width > 600 ? 64 : 16
            anchors.left: parent.left
            anchors.leftMargin: 64
            radius: 15
            border.color: "#D4E0E8"
            border.width: 1
            visible: parent.height > 350 ? true : false

            Label {
                width: parent.width - 64

                font.family: "Roboto"
                text: qsTr("Привет. Чем интересуешься? Расскажи про себя.")
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.width > 600 ? 16 : 4
            }

            OpacityAnimator {
                target: quest
                from: 0
                to: 1
                duration: 1000
                running: true
            }
        }

        Rectangle {
            id: answer
            width: parent.width / 1.5
            height: parent.height > 650 ? 64 : 86
            anchors.top: parent.top
            anchors.topMargin: parent.width > 600 ? 160 : 104
            anchors.right: parent.right
            anchors.rightMargin: 64
            radius: 15
            border.color: "#B9D9BE"
            border.width: 1
            color: "#E2FFC9"
            visible: parent.height > 370 ? true : false

            Label {
                width: parent.width - 64

                font.family: "Roboto"
                text: qsTr("Привет мир. Очень нравятся кастомные прошивки для телефонов, роутеров и свитчей. Люблю патчить ядро линукса (нет). Жду официальную поддержку UKSM в ядре.")
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.width > 600 ? 16 : 4
            }

            OpacityAnimator {
                target: answer
                from: 0
                to: 1
                duration: 2000
                running: true
            }
        }

        Rectangle {
            id: quest2
            width: parent.width / 1.5
            height: 64
            anchors.top: parent.top
            anchors.topMargin: parent.width > 600 ? 288 : 208
            anchors.left: parent.left
            anchors.leftMargin: 64
            radius: 15
            border.color: "#D4E0E8"
            border.width: 1
            visible: parent.height > 400 ? true : false

            Label {
                width: parent.width - 64

                font.family: "Roboto"
                text: qsTr("Чем забиваешь свое основное свободное время?")
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.width > 600 ? 16 : 4
            }

            OpacityAnimator {
                target: quest2
                from: 0
                to: 1
                duration: 3000
                running: true
            }
        }

        Rectangle {
            id: answer2
            width: parent.width / 1.5
            height: 128
            anchors.top: parent.top
            anchors.topMargin: parent.width > 600 ? 384 : 312
            anchors.right: parent.right
            anchors.rightMargin: 64
            radius: 15
            border.color: "#B9D9BE"
            border.width: 1
            color: "#E2FFC9"
            visible: parent.height > 450 ? true : false

            Label {
                width: parent.width - 64

                font.family: "Roboto"
                text: qsTr("В основном поддерживаю как меинтейнер свои репозитории, народ иногда пишет issue или закидывают патчи по почте. Всегда экспериментирую поэтому так много репозиториев.")
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.width > 600 ? 16 : 4
            }

            Label {
                width: parent.width - 64

                font.family: "Roboto"
                text: qsTr("Мой Github: https://github.com/germanaizek")
                wrapMode: Text.WordWrap
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: parent.width > 600 ? 80 : 100
            }

            OpacityAnimator {
                target: answer2
                from: 0
                to: 1
                duration: 4000
                running: true
            }
        }
    }

    DropShadow {
        anchors.fill: rect
        horizontalOffset: 1
        verticalOffset: 1
        radius: 15
        samples: 10
        source: rect
        color: "black"
    }
}
