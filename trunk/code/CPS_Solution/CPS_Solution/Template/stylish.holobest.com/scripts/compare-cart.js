
var arr_product = [];
//if (typeof sessionStorage["cart"] != 'undefined') {
//    arr_product = JSON.parse(sessionStorage["cart"]);
//}

$(function () {
    
    //Add product to compare cart
    $('.addToCompare').on('click', function () {
        var id = this.attributes['product-id'].value;
        var name = this.attributes['product-name'].value;

        //Hide add to compare button
        
            
        //Add product to compare cart
        if (arr_product.length < 3) {
            arr_product.push(id);
            $(".addToCompare[product-id='" + id + "']").hide(); 
        } else {
            alert('asd');
            return;
        }
        
        $("#compare_panel ul").append('<li class="' + id + '">' + name + '<a class="compare-remove" onclick="removeProduct(' + id + ')">X</a></li>');
        //sessionStorage["cart"] = JSON.stringify(arr_product);
        //
        checkCart();
    });
       
    $('.compare-button').on('click', function () {
        //sessionStorage.clear();
    });
});

function removeProduct(x) {
    for (var i = 0; i < arr_product.length; ++i) {
        if (arr_product[i] == x) {
            $('.' + x).remove();
            arr_product.splice(i, 1);
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
}




