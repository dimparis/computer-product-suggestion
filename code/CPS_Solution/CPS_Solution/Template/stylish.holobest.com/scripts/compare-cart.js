﻿
var arr_product = [];

$(function () {

    //Add product to compare cart
    $('.addToCompare').on('click', function () {

        var id = this.attributes['product-id'].value;
        var name = this.attributes['product-name'].value;

        if (sessionStorage.length <= 2) {
            sessionStorage.setItem("'product-" + id, id);
            arr_product.push(id);
            $(".addToCompare[product-id='" + id + "']").hide();

        } else {
            alert("Danh sách không được nhi ềuhơn 3 sản phẩm.");
            return false;
        }
        $("#compare_panel ul").append('<li class="' + id + '">' + name + '<a class="compare-remove" onclick="removeProduct(' + id + ')">X</a></li>');
        checkCart();
    });

    $('.compare-button').on('click', function () {
        if (sessionStorage.length < 2) {
            //Danh sach it hon 2 san pham thi bao loi
            alert("Phải có ít nhất 2 sản phẩm để so sánh.", "warn");
        } else if (sessionStorage.length == 2) {
            //Khi danh sach chi co 2 san pham thi id san pham 3 = -1
            var p1 = sessionStorage.getItem(sessionStorage.key(0))
            var p2 = sessionStorage.getItem(sessionStorage.key(1))
            sessionStorage.clear();
            window.location.replace('Compare?p1=' + p1 + '&p2=' + p2 + '&p3=-1');
        } else {
            var p1 = sessionStorage.getItem(sessionStorage.key(0))
            var p2 = sessionStorage.getItem(sessionStorage.key(1))
            var p3 = sessionStorage.getItem(sessionStorage.key(2))
            sessionStorage.clear();
            //Khi danh sach co du 3 san pham
            window.location.replace('Compare?p1=' + p1 + '&p2=' + p2 + '&p3=' + p3);
        }

    });

    $('.compare-close').on('click', function () {
        $("#compare_panel").toggle("slide", { direction: "right" }, 1000);
    });
});

function addToCompare() {
	var id = this.attributes['product-id'].value;
    var name = this.attributes['product-name'].value;

    if (sessionStorage.length <= 2) {
        sessionStorage.setItem("'product-" + id, id);
        $(".addToCompare[product-id='" + id + "']").hide();

    } else {
        alert("Nhieu hon 3 sp");
        return false;
    }
    $("#compare_panel ul").append('<li class="' + id + '">' + name + '<a class="compare-remove" onclick="removeProduct(' + id + ')">X</a></li>');
    $("#compare_panel").show();

}

$('.compare-button').on('click', function () {
    if (sessionStorage.length < 2) {
        //Danh sach it hon 2 san pham thi bao loi
        alert("Phải có ít nhất 2 sản phẩm để so sánh.", "warn");
    } else if (sessionStorage.length == 2) {
        //Khi danh sach chi co 2 san pham thi id san pham 3 = -1
        var p1 = sessionStorage.getItem(sessionStorage.key(0))
        var p2 = sessionStorage.getItem(sessionStorage.key(1))
        sessionStorage.clear();
        window.location.replace('Compare?p1=' + p1 + '&p2=' + p2 + '&p3=-1');
    } else {
        var p1 = sessionStorage.getItem(sessionStorage.key(0))
        var p2 = sessionStorage.getItem(sessionStorage.key(1))
        var p3 = sessionStorage.getItem(sessionStorage.key(2))
        sessionStorage.clear();
        //Khi danh sach co du 3 san pham
        window.location.replace('Compare?p1=' + p1 + '&p2=' + p2 + '&p3=' + p3);
    }

});

$('.addToCompare').on('click', function () {
    var id = this.attributes['product-id'].value;
    var name = this.attributes['product-name'].value;

    if (sessionStorage.length <= 2) {
        sessionStorage.setItem("'product-" + id, id);
        $(".addToCompare[product-id='" + id + "']").hide();

    } else {
        alert("Nhieu hon 3 sp");
        return false;
    }
    $("#compare_panel ul").append('<li class="' + id + '">' + name + '<a class="compare-remove" onclick="removeProduct(' + id + ')">X</a></li>');
    $("#compare_panel").show();

});

function add(id, name) {
    if (sessionStorage.length <= 2) {
        sessionStorage.setItem("'product-" + id, id);
        $(".addToCompare[product-id='" + id + "']").hide();
        return true;
    } else {
        return false;
    }
};

function removeProduct(x) {
    for (var i = 0; i < sessionStorage.length; i++) {
        if (sessionStorage.getItem(sessionStorage.key(i)) == x) {
            sessionStorage.removeItem(sessionStorage.key(i));
            arr_product.slice(x, 1);
            $('.' + x).remove();
            $(".addToCompare[product-id='" + x + "']").show();
            checkCart();
            return;
        }
    }
};

function checkCart() {
    if ($("#compare_panel ul").html() != "") {
        $("#compare_panel").show();
    } else {
        $("#compare_panel").hide();
    }
};

function checkSession() {
    if (sessionStorage.length == 0) {
        $("#compare_panel").hide();

    } else {
        for (var i = 0; i < sessionStorage.length; i++) {
            var id = sessionStorage.getItem(sessionStorage.key(i));
            var name = $(".addToCompare[product-id=" + id + "]").attr("product-name");
            $(".addToCompare[product-id='" + id + "']").hide();
            $("#compare_panel ul").append('<li class="' + id + '">' + name + '<a class="compare-remove" onclick="removeProduct(' + id + ')">X</a></li>');

        }
    }
};

function runEffect(id) {
    var options = {
        to: "#compare_panel",
        className: "ui-effects-transfer",
    };

    $("#"+id).effect("transfer", options, 1000);
};




