import QtQuick 2.15
import QtQuick.Controls 2.15

// stackView.depth > 1 ?

ApplicationWindow {
    id: window
    width: 640
    height: 480
    visibility: Qt.WindowFullScreen
    title: qsTr("Stack")
    property int spacingval: 10

    header: ToolBar {
        contentHeight: about.implicitHeight

        ToolButton {
            id: about
            text: stackView.depth > 1 ? "\u25C0" : "\u2630"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            //anchors.right: parent.left
            anchors.rightMargin: 96
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                    circle.visible = true
                    triangle.visible = true
                    square.visible = true
                    buttonClear.visible = true
                } else {
                    drawer.open()
                }
            }
        }

        ToolButton {
            id: circle
            text: "\u25EF"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            anchors.right: parent.right
            anchors.rightMargin: 96
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
            onPressed: {
                circle.text = "\u25CF"
                circle.font.pixelSize = Qt.application.font.pixelSize * 1.9
            }
            onReleased: {
                circle.text = "\u25EF"
                circle.font.pixelSize = Qt.application.font.pixelSize * 1.6
            }
        }

        ToolButton {
            id: triangle
            text: "\u25B5"
            font.pixelSize: Qt.application.font.pixelSize * 2.1
            anchors.right: parent.right
            anchors.rightMargin: 48
            onClicked: {
                //triangle.text = "\u25B4"
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
            onPressed: {
                triangle.text = "\u25B4"
                triangle.font.pixelSize = Qt.application.font.pixelSize * 2.6
            }
            onReleased: {
                triangle.text = "\u25B5"
                triangle.font.pixelSize = Qt.application.font.pixelSize * 2.1
            }
        }

        ToolButton {
            id: square
            text: "\u25A1"
            font.pixelSize: Qt.application.font.pixelSize * 1.6
            anchors.right: parent.right
            anchors.rightMargin: 0
            onClicked: {
                var newObject = Qt.createQmlObject('import CustomClass.Figures 1.0; Circle { anchors.leftMargin: window.spacingval; anchors.topMargin: window.spacingval; anchors.fill: parent; }',
                                                   figuresfield,
                                                   "dynamicSnippet1");
                window.spacingval += 10;
            }
            onPressed: {
                square.text = "\u25A0"
                square.font.pixelSize = Qt.application.font.pixelSize * 0.9
            }
            onReleased: {
                square.text = "\u25A1"
                square.font.pixelSize = Qt.application.font.pixelSize * 1.6
            }
        }

        Label {
            text: stackView.currentItem.title
            anchors.centerIn: parent
        }
    }

    Drawer {
        id: drawer
        width: window.width * 0.66
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                text: qsTr("Обо мне")
                width: parent.width
                onClicked: {
                    circle.visible = false
                    triangle.visible = false
                    square.visible = false
                    buttonClear.visible = false
                    stackView.push("about.ui.qml")
                    drawer.close()
                }
            }
        }
    }

    StackView {
        id: stackView
        initialItem: "HomeForm.ui.qml"
        anchors.fill: parent
    }

    Row {
        id: figuresfield
        width: parent.width - 100
        height: parent.height - 100
        spacing: 5
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Row {
        id: buttons
        width: parent.width
        height: 64
        //visible: true
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: buttonClear
            anchors.horizontalCenter: parent.horizontalCenter
            width: window.width - 20
            text: qsTr("Очистить")
            onClicked: {
                window.spacingval = 0;
            }
        }
    }
}
