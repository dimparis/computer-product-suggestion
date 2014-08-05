$(function () {

    //Add product to compare cart
    $('.members-wrapper').on('click', '.addToCompare', function () {
        var id = this.attributes['product-id'].value;
        var name = this.attributes['product-name'].value;

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
        $("#compare_panel ul").append('<li class="' + id + '">' + name + '<a class="compare-remove" onclick="removeProduct(' + id + ')">X</a></li>');
        checkCart();
    });

});