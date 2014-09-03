$(function () {

    //Add product to compare cart
    $('#loadItemcontainer').on('click', '.addToCompare', function () {
        var id = this.attributes['product-id'].value;
        var name = this.attributes['product-name'].value;
        var img = this.attributes['product-img'].value;

        if (sessionStorage.length < 6) {
            sessionStorage.setItem("'product-" + id, id);
            sessionStorage.setItem("'product-" + id + "-name", name);
            $(".addToCompare[product-id='" + id + "']").hide();

        } else {
            alert("Danh sách không được nhiều hơn 3 sản phẩm.");
            return false;
        }
        //Hieu ung add to list
        jQuery(".img-" + id).effect("transfer", { to: ".icon-shopping-cart", className: "ui-effects-transfer" }, 1000);
        $("#compare_panel ul").append('<li style="padding-right: 5px;" class="' + id + '">' + name + '<a class="compare-remove" onclick="removeProduct(' + id + ')">X</a></li>');
        checkCart();
    });

    $('.compare-button').on('click', function () {
        if (sessionStorage.length == 0 || sessionStorage.length == 2) {
            //Danh sach it hon 2 san pham thi bao loi
            alert("Phải có ít nhất 2 sản phẩm để so sánh.");
        } else if (sessionStorage.length == 4) {
            //Khi danh sach chi co 2 san pham thi id san pham 3 = -1
            var p1 = sessionStorage.getItem(sessionStorage.key(0))
            var p2 = sessionStorage.getItem(sessionStorage.key(2))
            sessionStorage.clear();
            /// Sang modifiy for Viet
            var createform = document.createElement('form'); // Create New Element form
            createform.setAttribute("action", "/Product/Compare"); // Setting action Attribute on form
            createform.setAttribute("method", "post"); // Setting method Attribute on form

            var input1 = document.createElement('input'); // Create input field for name
            input1.setAttribute("type", "hidden");
            input1.setAttribute("id", "p1");
            input1.setAttribute("name", "p1");
            input1.setAttribute("value", Number(p1));
            createform.appendChild(input1);

            var input2 = document.createElement('input'); // Create input field for name
            input2.setAttribute("id", "p2");
            input2.setAttribute("name", "p2");
            input2.setAttribute("type", "hidden");
            input2.setAttribute("value",  Number(p2));
            createform.appendChild(input2);

            var input3 = document.createElement('input'); // Create input field for name
            input3.setAttribute("type", "hidden");
            input3.setAttribute("id", "p3");
            input3.setAttribute("name", "p3");
            input3.setAttribute("value", -1);
            createform.appendChild(input3);

            createform.submit();
            ///

            //window.location.replace('Compare?p1=' + p1 + '&p2=' + p2 + '&p3=-1');
        } else {
            var p1 = sessionStorage.getItem(sessionStorage.key(0))
            var p2 = sessionStorage.getItem(sessionStorage.key(2))
            var p3 = sessionStorage.getItem(sessionStorage.key(4))
            sessionStorage.clear();
            //Khi danh sach co du 3 san pham
            /// Sang modifiy for Viet
            var createform = document.createElement('form'); // Create New Element form
            createform.setAttribute("action", "/Product/Compare"); // Setting action Attribute on form
            createform.setAttribute("method", "post"); // Setting method Attribute on form

            var input1 = document.createElement('input'); // Create input field for name
            input1.setAttribute("type", "hidden");
            input1.setAttribute("id", "p1");
            input1.setAttribute("name", "p1");
            input1.setAttribute("value", Number(p1));
            createform.appendChild(input1);

            var input2 = document.createElement('input'); // Create input field for name
            input2.setAttribute("id", "p2");
            input2.setAttribute("name", "p2");
            input2.setAttribute("type", "hidden");
            input2.setAttribute("value", Number(p2));
            createform.appendChild(input2);

            var input3 = document.createElement('input'); // Create input field for name
            input3.setAttribute("type", "hidden");
            input3.setAttribute("id", "p3");
            input3.setAttribute("name", "p3");
            input3.setAttribute("value", Number(p3));
            createform.appendChild(input3);

            createform.submit();

            //window.location.replace('Compare?p1=' + p1 + '&p2=' + p2 + '&p3=' + p3);
        }

    });
});

function removeProduct(x) {
    for (var i = 0; i < sessionStorage.length; i++) {
        if (sessionStorage.getItem(sessionStorage.key(i)) == x) {
            sessionStorage.removeItem(sessionStorage.key(i));
            sessionStorage.removeItem(sessionStorage.key(i));
            $('.' + x).remove();
            $(".addToCompare[product-id='" + x + "']").show();
            checkCart();
            return;
        }
    }
};

function checkCart() {
    if ($("#compare_panel ul").html() != "") {
        $("#compare_panel").show("slide").delay(1000);
        $("#compare_panel").hide("toggle");
        $(".list-cart").fadeIn(300);
    } else {
        $("#compare_panel").hide("slide");
        $(".list-cart").fadeIn(300);
    }
};

function checkSession() {
    if (sessionStorage.length == 0) {
        $("#compare_panel").hide();
    } else {
        for (var i = 0; i < sessionStorage.length; i++) {
            var id = sessionStorage.getItem(sessionStorage.key(i));
            var name = sessionStorage.getItem(sessionStorage.key(i + 1));
            i++;
            $(".addToCompare[product-id='" + id + "']").hide();
            $("#compare_panel ul").append('<li style="padding-right: 5px;" class="' + id + '">' + name + '<a class="compare-remove" onclick="removeProduct(' + id + ')">X</a></li>');
        }
        checkCart();
    }
};