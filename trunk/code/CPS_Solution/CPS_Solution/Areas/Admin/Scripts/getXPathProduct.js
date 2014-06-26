﻿var displayType, currentStep;
var prevExp = "";
var $tile = $('#xpathTile');
var $productName = $('#xpathProductName');
var $paging = $('#xpathPaging');
var $cpu = $('#xpathCPU');
var $hdd = $('#xpathHDD');
var $vga = $('#xpathVGA');
var $ram = $('#xpathRAM');
var $display = $('#xpathDisplay');

$('#Parseform').daWizard({
    nextButtonLabel: 'Sau',
    prevButtonLabel: 'Trước',
    submitButtonLabel: 'Hoàn thành',
    forwardOnly: false,
    onLeaveStep: validateStep,
    onShowStep: showStep
});

$('form#Parseform button[class="da-button green"]').click(function (event) {
    event.stopImmediatePropagation();
    location.href = "/Admin/Parser";
});
function validateStep(index, fset) {
    currentStep = getStep(fset.attr("data-step-id"));
    if (typeof fset != "undefined") {
        switch (fset.attr("data-name")) {
            case "type":
                displayType = $('input[type="radio"]:checked', fset).val();
                if (displayType == "table") {
                    $tile.prop("disabled", true);
                } else {
                    $tile.prop("disabled", false);
                }
                return true;
            case "divInfo":
                if (displayType == "grid" && $tile.val() == "") {
                    alert("Phải chọn khung thông tin");
                    return false;
                }
                return true;
            case "productName":
                if ($productName.val() == "") {
                    alert("Phải chọn tên sản phẩm");
                    return false;
                }
                return true;
            case "cpu":
                if ($cpu.val() == "") {
                    alert("Phải chọn  Vi xử lí(CPU)");
                    return false;
                }
                return true;
            case "hdd":
                if ($hdd.val() == "") {
                    alert("Phải chọn dung lương đĩa cứng (HDD)");
                    return false;
                }
                return true;
            case "vga":
                if ($vga.val() == "") {
                    alert("Phải chọn  Card đồ họa (VGA/GPU)");
                    return false;
                }
                return true;
            case "ram":
                if ($ram.val() == "") {
                    alert("Phải chọn  bộ nhớ (RAM)");
                    return false;
                }
                return true;
            case "display":
                if ($display.val() == "") {
                    alert("Phải chọn Màn hình(Display/Monitor)");
                    return false;
                }
                return true;
            default:
                return true;
        }
    }
    return true;
}

function showStep(fset) {
    var step = getStep(fset);
    currentStep = step;
}

function getStep(str) {
    return Number(str);
}

var tmp = document.getElementById("webDiv");
var myFrameDoc;
tmp.onload = init;
var webDiv = null;
var tile = null;

function init() {
    webDiv = (tmp.contentWindow || tmp.contentDocument);
    if (webDiv.document) {
        myFrameDoc = webDiv.document;
        webDiv = webDiv.document.body;
    }

    if (webDiv != null) {
        webDiv.onclick = getXPath;
        var divChild = webDiv.childNodes;
        for (var i = 0; i < divChild.length; i++) {
            divChild[i].onmouseover = mouseIn;
            divChild[i].onmouseout = mouseOut;
        }
    }
}

function mouseIn(event) {
    var element = event.target;
    element.style.outline = "thin dashed #FF0000";
}

function mouseOut(event) {
    var element = event.target;
    element.style.outline = "none";
}

function clearHighlight(xpathExpression) {
    var selected = myFrameDoc.evaluate(xpathExpression, myFrameDoc, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    for (var i = 0; i < selected.snapshotLength; i++) {
        var node = selected.snapshotItem(0);
        node.style.outline = "none";
    }
}

function highlightElement(xpathExpression) {
    xpathExpression = xpathExpression.replace("[i]", "");
    if (prevExp != "") {
        clearHighlight(prevExp);
    }
    var selected = myFrameDoc.evaluate(xpathExpression, myFrameDoc, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null);
    for (var i = 0; i < selected.snapshotLength; i++) {
        var node = selected.snapshotItem(0);
        node.style.outline = "thin dashed #FF0000";
    }
    prevExp = xpathExpression;
}

function XpathElement(tagName, id, className, position) {
    this.tagName = tagName;
    this.id = id;
    this.className = className;
    this.position = position;
}

function getPath(clickedNode, root) {
    var node = clickedNode;

    var parent = null;
    var children = null;
    var element = null;
    var pos = 0;
    var xpath = [];
    var counter = 0;
    var foundId = false;
    while (true) {
        if (node === root) {
            break;
        }
        if (node.id !== "") {
            foundId = true;
            break;
        }
        parent = node.parentNode;
        children = parent.childNodes;
        counter = 0;
        pos = 0;
        for (var i = 0; i < children.length; i++) {
            if (children[i].nodeType == 1 && children[i].tagName == node.tagName) {
                counter++;
            }
            if (children[i] == node) {
                pos = counter;
            }
            if (pos > 0 && counter > 1) {
                break;
            }
        }
        element = new XpathElement(node.tagName.toLowerCase(), node.id, node.className, -1);
        if (counter > 1) {
            element.position = pos;
        }
        xpath.push(element);
        node = parent;
    }
    if (foundId) {
        element = new XpathElement(node.tagName.toLowerCase(), node.id, node.className, -1);
        xpath.push(element);
    } else if (root == webDiv) {
        element = new XpathElement("body", node.id, node.className, -1);
        xpath.push(element);
        element = new XpathElement("html", node.id, node.className, -1);
        xpath.push(element);
    }
    return xpath;
}

function setTextBoxXpathValue(expression) {
    if (currentStep == 2) {
        $productName.val(expression);
    } else if (currentStep == 1) {
        $tile.val(expression);
    } else if (currentStep == 3) {
        $cpu.val(expression);
    } else if (currentStep == 4) {
        $vga.val(expression);
    } else if (currentStep == 5) {
        $hdd.val(expression);
    } else if (currentStep == 6) {
        $ram.val(expression);
    } else if (currentStep == 7) {
        $display.val(expression);
    }
}

function getXPath(event) {
    event.preventDefault();
    if (currentStep == 10) {
        getPaging(event);
        return;
    }
    if (displayType == "table" && currentStep != 1) {
        getTabularPath(event);
    } else if (displayType == "grid") {
        getGridPath(event);
    }
}

function getTabularPath(event) {
    var xpath = getPath(event.target, webDiv);
    var result = "";
    xpath.reverse();
    if (xpath[0].id != "") {
        result += "//*[@id='" + xpath[0].id + "']";
        for (i = 1; i < xpath.length; i++) {
            result += "/" + xpath[i].tagName;
            if (xpath[i].position != -1) {
                result += "[" + xpath[i].position + "]";
            }
        }
    } else {
        for (i = 0; i < xpath.length; i++) {
            result += xpath[i].tagName;
            if (xpath[i].position != -1) {
                result += "[" + xpath[i].position + "]";
            }
            result += "/";
        }
        result = result.slice(0, -1);
    }
    highlightElement(result);
    result = result.replace("/tbody", "");
    setTextBoxXpathValue(result);
}

function getGridPath(event) {
    var target = event.target;
    var result = "";
    //document.getElementById("rad_tile").checked
    if (currentStep == 1) {
        tile = target;
        result += "//" + target.tagName.toLowerCase() + "[@class='" + target.className + "']";
        setTextBoxXpathValue(result);
        highlightElement(result);
        return;
    }

    if ($tile.val() == "") {
        alert("Phải chọn khung thông tin trước!");
        return;
    }
    result = document.getElementById("xpathTile").value;
    result += "[i]";
    var xpath = getPath(target, tile);
    xpath.reverse();
    for (var i = 0; i < xpath.length; i++) {
        result += "/" + xpath[i].tagName;
        if (xpath[i].position != -1) {
            result += "[" + xpath[i].position + "]";
        }
    }
    setTextBoxXpathValue(result);
    highlightElement(result);
}

function getPaging(event) {
    var xpath = getPath(event.target, webDiv);
    xpath[0].position = -1;
    //xpath[0].tagName += "[i]";
    xpath.reverse();
    var result = "";

    if (xpath[0].id != "") {
        result += "//*[@id='" + xpath[0].id + "']";
        for (var i = 1; i < xpath.length; i++) {
            result += "/" + xpath[i].tagName;
            if (xpath[i].position != -1) {
                result += "[" + xpath[i].position + "]";
            }
        }
    } else {
        for (i = 0; i < xpath.length; i++) {
            if (xpath[i].position != -1) {
                result += "[" + xpath[i].position + "]";
            }
            result += "/";
        }
        result = result.slice(0, -1);
    }
    highlightElement(result);
    result = result.replace("/tbody", "");
    setTextBoxXpathValue(result);
}