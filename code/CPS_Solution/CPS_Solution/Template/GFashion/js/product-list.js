var a = [];
$(function () {
    $.notify.defaults(
        {
            autoHideDelay: 1100,
            globalPosition: 'top center',
            showDuration: 400,
        }
    )
    $('.product').on({
        mouseenter: function () {
            var id = this.querySelector('input').value;
            if (isExisted(id)) {
                this.style.backgroundColor = '#FF99FF';
            } else {
                this.style.backgroundColor = 'yellow';
            }
        },
        mouseleave: function () {
            this.style.backgroundColor = '#DDDDDD';
        }
    });
    $('.product').on('click', function () {
        var id = this.attributes['data-product-id'].value;
        var name = this.attributes['data-product-name'].value;
        if (isExisted(id)) {
            //alert(name + ' đã có trong danh sách!');
            $.notify(name + " đã có trong danh sách so sánh", "warn");
        } else {
            if (a.length == 3) {
                //alert('Danh sách so sánh không được nhiều hơn 3 sản phẩm.');
                $.notify("Danh sách so sánh không được nhiều hơn 3 sản phẩm.", "warn");
            } else {
                a.push(id);
                $('#quantity').html(a.length);                
                createInfo();
                $.notify(name + " vừa được thêm vào danh sách so sánh", "success");
                
            }
        }
    });

    function isExisted(id) {
        for (var i = 0; i < a.length; ++i) {
            if (a[i] == id) return true;
        }
        return false;
    };

    $('#cart').on('click', function () {
        createInfo();
    });

});

function createInfo() {
    var t = '<div style="margin: 10px 0px -10px 10px;"><strong><b>Dach sách sản phẩm:</b></strong></div><hr><div style="background-color:#F7A191;">';
    for (var i = 0; i < a.length; ++i) {
        var x = a[i];
        var parent = document.querySelector('input[value="' + x + '"]').parentNode;
        //t += parent.querySelector('a').innerHTML + ' <button onclick="removeProduct(' + x + ')">Remove</button><br/>';
        t += '<div style="margin-top:10px;"><img src="/Template/GFashion/img/remove.png" onclick="removeProduct(' + x + ')" style="margin: -5px 10px 0px 15px"/>' + parent.querySelector('a').innerHTML + '</div>';
    }
    t += '</div><hr>';
    t += '<button onclick="goCompare()" class="btn btn-default btn-xs" style="float:right; margin:-10px 10px 10px 10px;">So Sánh</button>';
    
    $("#info").html(t);
};

function removeProduct(x) {
    for (var i = 0; i < a.length; ++i) {
        if (a[i] == x) {
            a.splice(i, 1);
            createInfo();
            $('#quantity').html(a.length);
            return;
        }
    }
};

function goCompare() {
    if (a.length == 2) {
        window.location.replace('Compare?p1=' + a[0] + '&p2=' + a[1] + '&p3=-1');
    }
    else {
        window.location.replace('Compare?p1=' + a[0] + '&p2=' + a[1] + '&p3=' + a[2]);
    }
}

