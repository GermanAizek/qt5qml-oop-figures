import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import CustomClass.Figures 1.0
import "redrawer.js" as Redrawer

ApplicationWindow {
    id: window
    width: 1024
    height: 768
    visibility: Qt.WindowFullScreen
    title: qsTr("QML PainterFigure")

    // init pos
    property int spacingval: 15
    property int x: 100
    property int y: 100

    // graphic object
    property var typesArray: []
    property var figuresArray: []
    property var posArray: []

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
                    figuresfield.visible = true
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
                Redrawer.draw();
                var newObject = Qt.createQmlObject('import CustomClass.Figures 1.0; Circle { anchors.fill: parent; anchors.leftMargin: window.x; anchors.topMargin: window.y; }',
                                                   figuresfield,
                                                   "dynamicSnippet");
                figuresArray.push(newObject);
                typesArray.push("circle");
                posArray.push([window.x,window.y])
                counter.text = "Количество фигур в массиве: " + figuresArray.length;
                window.x += window.spacingval;
                window.y += window.spacingval;
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
                Redrawer.draw();
                var newObject = Qt.createQmlObject('import CustomClass.Figures 1.0; Triangle { anchors.fill: parent; anchors.leftMargin: window.x; anchors.topMargin: window.y; }',
                                                   figuresfield,
                                                   "dynamicSnippet");
                figuresArray.push(newObject);
                typesArray.push("triangle");
                posArray.push([window.x,window.y])
                counter.text = "Количество фигур в массиве: " + figuresArray.length;
                window.x += window.spacingval;
                window.y += window.spacingval;
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
                Redrawer.draw();
                var newObject = Qt.createQmlObject('import CustomClass.Figures 1.0; Square { anchors.fill: parent; anchors.leftMargin: window.x; anchors.topMargin: window.y; }',
                                                   figuresfield,
                                                   "dynamicSnippet");
                figuresArray.push(newObject);
                typesArray.push("square");
                posArray.push([window.x,window.y])
                counter.text = "Количество фигур в массиве: " + figuresArray.length;
                window.x += window.spacingval;
                window.y += window.spacingval;
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
        width: window.width * 0.33
        height: window.height

        Column {
            anchors.fill: parent

            ItemDelegate {
                width: parent.width
                height: 200
                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "#4C84B5"

                    Image {
                        id: avatar
                        width: 76
                        height: 76
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        anchors.top: parent.top
                        anchors.topMargin: 50
                        visible: false
                        source: "images/seriouscat.jpg"
                    }

                    OpacityMask {
                        anchors.fill: avatar
                        source: avatar
                        maskSource: Rectangle {
                            id: opacitymask
                            width: avatar.width
                            height: avatar.height
                            radius: 50
                            visible: false
                        }
                    }

                    Label {
                        font.family: "Roboto"
                        font.bold: true
                        font.pixelSize: 16
                        text: qsTr("German Semenov")
                        color: "white"
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        anchors.top: parent.top
                        anchors.topMargin: 140
                    }

                    Label {
                        font.family: "Roboto"
                        text: "<a href='tel:+74991120119'>+7 (499) 112-01-19</a>"
                        linkColor: "white"
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        anchors.top: parent.top
                        anchors.topMargin: 168
                        onLinkActivated: Qt.openUrlExternally('tel:+74991120119')
                    }
                }
            }

            ItemDelegate {
                width: parent.width

                Label {
                    font.family: "Roboto"
                    font.pixelSize: 22
                    text: "\u260E"
                    color: "grey"
                    anchors.left: parent.left
                    anchors.leftMargin: 30
                    anchors.verticalCenter: parent.verticalCenter
                }

                Label {
                    font.family: "Roboto"
                    font.pixelSize: 16
                    text: qsTr("About me")
                    width: parent.width
                    anchors.left: parent.left
                    anchors.leftMargin: 90
                    anchors.verticalCenter: parent.verticalCenter
                }
                onClicked: {
                    circle.visible = false
                    triangle.visible = false
                    square.visible = false
                    buttonClear.visible = false
                    figuresfield.visible = false
                    stackView.push("about.ui.qml")
                    drawer.close()
                }




            }
        }
    }

    StackView {
        id: stackView
        initialItem: "instruction.ui.qml"
        anchors.fill: parent
    }

    Label {
        id: figuresfield
        width: parent.width
        height: parent.height - 100
        anchors.fill: parent
        anchors.top: parent.top
        anchors.topMargin: 100
    }

    Label {
        id: counter
        width: parent.width
        height: 128
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 32
        text: qsTr("Количество фигур в массиве: 0")

        Button {
            id: buttonClear
            width: window.width - 128
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Roboto"
            font.bold: true
            font.italic: false
            text: qsTr("Очистить")
            property var prevcleaner: null
            onClicked: {
                if (prevcleaner) prevcleaner.destroy()
                for (var i = 0; i < figuresArray.length; i++) {
                    figuresArray[i].destroy();
                }
                figuresArray.splice(0, figuresArray.length);
                typesArray.splice(0, figuresArray.length);
                posArray.splice(0, figuresArray.length);

                counter.text = "Количество фигур в массиве: " + figuresArray.length;
                prevcleaner = Qt.createQmlObject('import CustomClass.Figures 1.0; Cleaner { anchors.fill: parent; }', figuresfield, "dynamicSnippet");
                window.x = 100;
                window.y = 100;
            }
        }
    }
}
