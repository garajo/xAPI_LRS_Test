module.exports = function (requestCfg, res) {
    "use strict";
    var json;
    console.log("------");
    console.log("RESOURCE = ", requestCfg.method, decodeURIComponent(requestCfg.url));
    console.log("HEADERS = ", requestCfg.headers);
    console.log("PARTS = ", requestCfg.multipart);
    console.log("BODY = ", requestCfg.body);
    console.log("::::::");
    console.log('RES-JS-TYPE', typeof res);
    try {
        if (res.statusCode === 500) {
            console.log("RES-MESSAGE = ", res.body.split("<p class=\"exc-message\">")[1].split("</p>")[0]);
            console.log("RES-TRACE = ", res.body.split("<div class=\"frame-code-container \">")[1].split("<div class=\"details\">")[0]);
        } else if (res.statusCode === 400) {
            json = JSON.parse(res.body);
            console.log("RES-MESSAGE = ", json.message);
            console.log("RES-TRACE = ", Array.isArray(json.trace) ? json.trace.map(function (item) {
                var file = String(item.file);
                var split = (file.indexOf("/") !== -1) ? "/" : "\\";
                return "" + file.split(split).slice(3).join("/") + " - " + item.line;
            }) : json.trace);
        } else {
            console.log("RES = ", res.statusCode, res.body);
            console.log("ETAG = ", res.headers.etag);
        }
    } catch (ex) {
        console.log(ex.message);
    }
    console.log("------");
};
