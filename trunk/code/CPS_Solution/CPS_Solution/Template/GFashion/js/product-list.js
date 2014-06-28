﻿$(function(){
	var a = [];
	$('.product').on({
		mouseenter: function(){
			var id = this.querySelector('input').value;
			if (isExisted(id)){
				this.style.backgroundColor = '#FF99FF';
			} else {
				this.style.backgroundColor = 'yellow';
			}
		},
		mouseleave: function(){
			this.style.backgroundColor = '#DDDDDD';
		}
	});
	$('.product').on('click', function(){
	    var id = this.attributes['data-product-id'].value;
	    var name = this.attributes['data-product-name'].value;
		if (isExisted(id)){
		    alert(name + ' đã có trong danh sách!');
		} else {
			if (a.length == 3){
				alert('Danh sách so sánh không được nhiều hơn 3 sản phẩm.');
			} else {
				a.push(id);
				$('#quantity').html(a.length);
			}
		}
	});
	
	function isExisted(id){
		for (var i = 0; i < a.length; ++i){ 
			if (a[i] == id) return true;
		}
		return false;
	}
	
	$('#cart').on('mousein', function(){
		var t = '';
		for (var i = 0; i < a.length; ++i){
			var x = a[i];
			var parent = document.querySelector('input[value="' + x + '"]').parentNode;
			t += parent.querySelector('a').innerHTML + '<br/>';
		}
		$("#info").html(t);
	});

	$('#btn-compare').on('click', function () {
	    if (a.length == 2) {
	        window.location.replace('Compare?x=' + a[0] + '&y=' + a[1] + '&z=-1');
	    }
	    else {
	        window.location.replace('Compare?x=' + a[0] + '&y=' + a[1] + '&z=' + a[2]);
	    }
	    
	});

})