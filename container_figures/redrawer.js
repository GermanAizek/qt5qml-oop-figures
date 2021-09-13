function draw() {
    for (var i = 0; i < figuresArray.length; i++) {
        let oldObject = null;
        let x = posArray[i][0];
        let y = posArray[i][1];
        if (!typesArray[i].localeCompare("circle")) {
            console.log("circle paint");
            oldObject = Qt.createQmlObject("import CustomClass.Figures 1.0; Circle { anchors.fill: parent; anchors.leftMargin: " + (x + 0) + "; anchors.topMargin: " + (y + 0) + "; }",
                                                               figuresfield,
                                                               "dynamicSnippet");
        }

        if (!typesArray[i].localeCompare("triangle")) {
            console.log("tr paint");
            oldObject = Qt.createQmlObject("import CustomClass.Figures 1.0; Triangle { anchors.fill: parent; anchors.leftMargin: " + x + "; anchors.topMargin: " + y + "; }",
                                                               figuresfield,
                                                               "dynamicSnippet");
        }

        if (!typesArray[i].localeCompare("square")) {
            console.log("sq paint");
            oldObject = Qt.createQmlObject("import CustomClass.Figures 1.0; Square { anchors.fill: parent; anchors.leftMargin: " + x + "; anchors.topMargin: " + y + "; }",
                                                               figuresfield,
                                                               "dynamicSnippet");
        }
        figuresArray[i].destroy();
        figuresArray[i] = oldObject;
    }
}
