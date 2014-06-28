var a = [];
$(function () {
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
            alert(name + ' đã có trong danh sách!');
        } else {
            if (a.length == 3) {
                alert('Danh sách so sánh không được nhiều hơn 3 sản phẩm.');
            } else {
                a.push(id);
                $('#quantity').html(a.length);
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
    var t = '';
    for (var i = 0; i < a.length; ++i) {
        var x = a[i];
        var parent = document.querySelector('input[value="' + x + '"]').parentNode;
        t += parent.querySelector('a').innerHTML + ' <button onclick="removeProduct(' + x + ')">Remove</button><br/>';
    }
    t += '<form action="/product/compare/" method="post">';
    t += '<input type="hidden" name="varX" value="' + a[0] + '">';
    t += '<input type="hidden" name="varY" value="' + a[1] + '">';
    t += '<button type="submit" class="btn btn-default btn-xs">So Sánh</button>';
    t += '</form>';
    $("#info").html(t);
};

function removeProduct(x) {
    for (var i = 0; i < a.length; ++i) {
        if (a[i] == x) {
            a.splice(i, 1);
            createInfo();
            return;
        }
    }
};

function aaa() {
    if (a.length == 2) {
        window.location.replace('Compare?x=' + a[0] + '&y=' + a[1] + '&z=-1');
    }
    else {
        window.location.replace('Compare?x=' + a[0] + '&y=' + a[1] + '&z=' + a[2]);
    }
}

