function commLoad(URL) {
    var retDom = null;
    try {
        retDom = new ActiveXObject('Microsoft.XMLDOM');
        retDom.async = false;
        retDom.load(URL);
    } catch (e) {
        retDom = document.implementation.createDocument("", "", null);
        retDom.async = false;
        retDom.load(URL);
    }

    return retDom;
}

function commLoadXML(xml) {
    var retDom = null;
    try {
        retDom = new ActiveXObject('Microsoft.XMLDOM');
        retDom.async = false;
        retDom.loadXML(xml);
    } catch (e) {
        var oParser = new DOMParser();
        retDom = oParser.parseFromString(xml, "text/xml");
    }

    return retDom;
}

function xml2New(xmlDom, xslDom) {
    var newDom = null;
    try {
        newDom = new ActiveXObject("Microsoft.XMLDOM");
        newDom.async = false;
        newDom.validateOnParse = false;
        xmlDom.transformNodeToObject(xslDom, newDom);
    } catch (e) {
        var xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xslDom);
        newDom = xsltProcessor.transformToDocument(xmlDom);
    }
    return newDom;
}