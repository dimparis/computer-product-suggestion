
var arr_product = [];


$(function () {
    
    //Add product to compare cart
    $('.addToCompare').on('click', function () {

        var id = this.attributes['product-id'].value;
        var name = this.attributes['product-name'].value;
        

        if (add(id, name)) {
            runEffect(id);
            
            var img = $("img[id=" + id + "]").attr("src");

            $(".ui-effects-transfer:last").css("background-image", "url(" + img + ")");
            $(".ui-effects-transfer:last").css("opacity", 0.4);
        } else {
            return false;
        }
        $("#compare_panel ul").append('<li class="' + id + '">' + name + '<a class="compare-remove" onclick="removeProduct(' + id + ')">X</a></li>');

        

      
        
        
        checkCart();
    });
       
    $('.compare-button').on('click', function () {
        sessionStorage.clear();
    });

    //$(".addToCompare").click(function () {
        
    //});
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
            $('.' + x).remove();
            $(".addToCompare[product-id='" + x + "']").show();
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




