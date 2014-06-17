
    $(document).ready(function () {
        //  var countProduct = $('#ProductTable tr').length;
        var count = $('#ProductTable tr').children().length;
    });

function saveProduct(index, maxCorrect) {
    var productId = $("#ProductId" + index).val();
    var productName = $("#ProductName" + index).val();
    var productMarketName = $("#ProductMarketName" + index).val();
    var productPrice = $("#ProductPrice" + index).val();

    $.ajax({
        type: "POST",
        url: '/Admin/Import/SaveProductError',
        data: { ProductId: productId, ProductName: productName, ProductMarketName: productMarketName, ProductPrice: productPrice },
        cache: true,
        success: function (result) {
            if (result.error.length == 0) {
                var stt = parseInt($('#ProductTable tr:last #STT').html()) + 1;
                var id = result.id;
                var lastId = parseInt($("tr:last").find("td")[0].id) +1;
                var lastId2 = lastId++;
                $("#ErrorArea").html("");
                if(result.status.toString() == "Duplicate Products List")
                {
                    $().toastmessage('showNoticeToast', '<div style="font-size:16px"><div style="text-align:center">Sản phẩm có thể bị trùng.</div><div style="margin-top:15px;text-align:center"> Vui lòng kiểm tra danh sách sản phẩm trùng.</div></div>');
                    $('tr:has(td:contains("'+result.nameDupProduct+'"))').parent('tbody').find("tr:last").after("<tr><td id='"+lastId+"' style='width:5%;text-align:center'>"+
                                                                              "<input type='checkbox'/>"+
                                                                          "</td> " +
                                                                          "<td style='width:40%'>"+productName+"</td> " +
                                                                          "<td style='width:35%'>"+ productMarketName+"</td>" +
                                                                          "<td style='width:10%;text-align:center'>"+ productPrice+"</td>" +
                                                                          "<td style='width:10%;text-align:center'> "+
                                                                          "<input  type='radio' name='productPrice_"+result.tableId+"' id='Check_"+result.tableId+"'/> "+
                                                                          "</td>"+
                                                                       "</tr>")
                    $("#ErrorProduct tr#ErrorProductTD" + index).remove();
                }
                else if(result.status.toString() == "Correct Products List")
                {
                    $().toastmessage('showNoticeToast', '<div style="font-size:16px"><div style="text-align:center">Sản phẩm có thể bị trùng.</div><div style="margin-top:15px;text-align:center"> Vui lòng kiểm tra danh sách sản phẩm trùng.</div></div>');
                    if(result.count == 1) // chưa có sp trùng
                    {
                        var dupTableCount = (result.count -1);
                        idDupTable = result.count ;
                        $("#tableEmpty").after("<br /> "+
                                                        "<div id='dupTable_"+dupTableCount +"' > " +
                                                          "<div class='row-fluid'> "+
                                                           "<div class='span12 widget'>"+
                                                             "<div class='widget-header'>"+
                                                               "<span class='title'>Nhóm sản phẩm trùng</span>"+
                                                               "<div class='toolbar'>"+
                                                                 "<div class='btn-group'>"+
                                                                   "<button class='btn' id='combine_"+dupTableCount+"' onclick='mergeProduct("+dupTableCount+")'>"+
                                                                   "<i class='icol-arrow-join'></i>Gộp</button>"+
                                                                   "<button class='btn' id='split_"+dupTableCount+"' onclick='split("+dupTableCount+")'>"+
                                                                   "<i class='icol-arrow-divide'></i>Tách</button>"+
                                                                   "</div>"+
                                                                 "</div>"+
                                                               "</div>"+
                                                             "</div>"+
                                                             "<div class='widget-content table-container'>"+
                                                               "<table id='table_"+dupTableCount+"'  class='table table-bordered table-striped table-checkable'>" +
                                                                 "<thead>"+
                                                                      "<tr id='header_"+dupTableCount+"'> "+
                                                                       "<th class='checkbox-column' id='checkboxAllTable_"+dupTableCount+"'  style='width:5%;text-align:center;border-right: 1px solid #dddddd;'>"+
                                                                         "<input type='checkbox' class='uniform' onclick='checkboxAllTable("+dupTableCount+")' />"+
                                                                       "</th> " +
                                                                       "<th style='width:40%;text-align:center;border-right: 1px solid #dddddd;'>Tên Sản Phẩm</th>"+
                                                                       "<th style='width:35%;text-align:center;border-right: 1px solid #dddddd;'>Tên Chợ</th> "+
                                                                       "<th style='width:10%;text-align:center;border-right: 1px solid #dddddd;'>Giá</th> "+
                                                                       "<th style='width:10%;text-align:center'>Chọn giá</th> " +
                                                                      "</tr> "+
                                                                 "</thead>"+
                                                                 "<tr class='checked'>"+
                                                                    "<td class='checked' id='"+lastId+"' onclick='checkboxChecked("+lastId+")'  style='width:5%;text-align:center;border-right: 1px solid #dddddd;'>"+
                                                                       "<input type='checkbox' checked='checked' id='checkbox' />"+
                                                                    "</td> " +
                                                                                 "<td style='width:40%;border-right: 1px solid #dddddd;'>"+productName+"</td> " +
                                                                                 "<td style='width:35%;border-right: 1px solid #dddddd;'>"+ productMarketName+"</td>" +
                                                                                 "<td style='width:10%;text-align:center;border-right: 1px solid #dddddd;>"+ productPrice+"</td>" +
                                                                                 "<td style='width:10%;text-align:center><input type='radio' name='productPrice_"+dupTableCount+"'  id='Check_"+dupTableCount+"' checked='checked'/> </td>" +
                                                                 "</tr> "+
                                                                 "<tr>"+
                                                                    "<td id='"+lastId2+"' onclick='checkboxChecked("+lastId2+")' style='width:5%;text-align:center'>"+
                                                                       "<input type='checkbox' id='checkbox'/>"+
                                                                    "</td> " +
                                                                                "<td style='width:40%'>"+result.correctProductName+"</td> " +
                                                                                "<td style='width:35%'>"+result.correctMarketName+"</td>" +
                                                                                "<td style='width:10%;text-align:center'>"+result.correctProductPrice+"</td>" +
                                                                                "<td style='width:10%;text-align:center'><input type='radio' name='productPrice_"+dupTableCount+"'  id='Check_"+dupTableCount+"'/> </td>"+ 
                                                                "</tr> "+
                                                              "</table>"+
                                                             "</div> "+
                                                           "</div> "+
                                                          "</div> "+
                                                        "</div>");

                        $("#ProductTable tr#product_"+result.tableCorrectId).remove();
                        $("#ErrorProduct tr#ErrorProductTD" + index).remove();
                    } 
                    else
                    {
                        var dupTableCount = result.count -2;
                        idDupTable = result.count -1;
                        $("#dupTable_"+dupTableCount).after("<br /> "+
                                                        "<div id='dupTable_"+idDupTable +"' > " +
                                                          "<div class='row-fluid'> "+
                                                           "<div class='span12 widget'>"+
                                                             "<div class='widget-header'>"+
                                                               "<span class='title'>Nhóm sản phẩm trùng</span>"+
                                                                "<div class='toolbar'>"+
                                                                   "<div class='btn-group'>"+
                                                                      "<button class='btn' id='combine_"+idDupTable+"' onclick='mergeProduct("+idDupTable+")'>"+
                                                                      "<i class='icol-arrow-join'></i>Gộp</button>"+
                                                                      "<button class='btn' id='split_"+idDupTable+"' onclick='split("+idDupTable+")'>"+
                                                                      "<i class='icol-arrow-divide'></i>Tách</button>"+
                                                                   "</div>"+
                                                                "</div>"+
                                                             "</div>"+
                                                              
                                                             "<div class='widget-content table-container'>"+
                                                               "<table id='table_"+idDupTable+"'  class='table table-bordered table-striped table-checkable'>" +
                                                                 "<thead>"+
                                                                      "<tr id='header_"+idDupTable+"'> "+
                                                                       "<th class='checkbox-column' id='checkboxAllTable_"+idDupTable+"'  style='width:5%;text-align:center;border-right: 1px solid #dddddd;'>"+
                                                                         "<input type='checkbox' class='uniform' onclick='checkboxAllTable("+idDupTable+")' />"+
                                                                       "</th> " +
                                                                       "<th style='width:40%;text-align:center;border-right: 1px solid #dddddd;'>Tên Sản Phẩm</th>"+
                                                                       "<th style='width:35%;text-align:center;border-right: 1px solid #dddddd;'>Tên Chợ</th> "+
                                                                       "<th style='width:10%;text-align:center;border-right: 1px solid #dddddd;'>Giá</th> "+
                                                                       "<th style='width:10%;text-align:center;border-right: 1px solid #dddddd;'>Chọn giá</th> " +
                                                                      "</tr> "+
                                                                 "</thead>"+
                                                                 "<tr class='checked'>"+
                                                                    "<td id='"+lastId+"' onclick='checkboxChecked("+lastId+")'  style='width:5%;text-align:center;border-right: 1px solid #dddddd;'>"+
                                                                      "<input type='checkbox' checked='checked' id='checkbox' />"+
                                                                    "</td> " +
                                                                    "<td style='width:40%;border-right: 1px solid #dddddd;'>"+productName+"</td> " +
                                                                    "<td style='width:35%;border-right: 1px solid #dddddd;'>"+ productMarketName+"</td>" +
                                                                    "<td style='width:10%;border-right: 1px solid #dddddd;'>"+ productPrice+"</td>" +
                                                                    "<td style='width:10%;border-right: 1px solid #dddddd;'>"+
                                                                       "<input type='radio' name='productPrice_"+idDupTable+"'  id='Check_"+idDupTable+"' checked/>" +
                                                                    "</td>"+
                                                                 "</tr> "+
                                                                 "<tr>"+
                                                                    "<td id='"+lastId2+"' onclick='checkboxChecked("+lastId2+")' style='width:5%;text-align:center'>"+
                                                                        "<input type='checkbox' id='checkbox'/> "+
                                                                    "</td> " +
                                                                    "<td style='width:40%;border-right: 1px solid #dddddd;'>"+result.correctProductName+"</td> " +
                                                                    "<td style='width:35%;border-right: 1px solid #dddddd;'>"+result.correctMarketName+"</td>" +
                                                                    "<td style='width:10%;border-right: 1px solid #dddddd;'>"+result.correctProductPrice+"</td>" +
                                                                    "<td style='width:10%;border-right: 1px solid #dddddd;'>"+
                                                                       "<input type='radio' name='productPrice_"+idDupTable+"'  id='Check_"+idDupTable+"'/>"+ 
                                                                    "</td>"+
                                                                "</tr> "+
                                                              "</table>"+
                                                            "</div> "+
                                                           "</div> "+
                                                          "</div> "+
                                                        "</div>");

                        //   $("#ProductTable tr#product_"+result.tableCorrectId).remove();
                        $('#ProductTable tr:has(td:contains("'+result.nameDupProduct+'"))').remove();
                        $("#ErrorProduct tr#ErrorProductTD" + index).remove();
                    }
                } else if(result.status.toString() != "Duplicate Products List" && result.status.toString() != "Correct Products List")
                {
                    $("#ProductTable tr:last").after("<tr id='product_"+id+"'>"+
                                                        "<td id='STT' style='text-align:center'>" + stt + "</td>"+
                                                        "<td>"+productName+"</td>"+
                                                        "<td style='text-align:center'>"+ productMarketName +"</td>"+
                                                        "<td style='text-align:center'>" + productPrice +"</td>"+
                                                        "<td style='text-align:center'> <button type='button' class='btn' onclick='deleteProduct("+id+")'>"+
                                                        "<i class='icol-cross'></i>Xóa</button></td>"+
                                                     "</tr>")
                    $("#ErrorProduct tr#ErrorProductTD" + index).remove();
                }
            }
            else {
                var errordisp = "";
                $.each(result.error, function (index, value) {
                    errordisp += "<label style='color: red'>" + value + "</label>"
                });
                $("#ErrorArea").html(errordisp);
                if(result.error.toString() == "Sản phẩm đã có.")
                {
                    var message = confirm("Sản phẩm đã có, bạn có muốn cập nhật sản phẩm này?")
                    if(message == true)
                    {
                        if(result.nameDupProduct) {
                            //  $("#product_"+result.id).find("td").find("input")[2].value = result.updatedPrice;
                            $('tr:has(td:contains("'+result.nameDupProduct+'"))').find("td")[4].innerHTML = result.updatedPrice;
                            $("#ErrorProduct tr#ErrorProductTD" + index).remove();
                            $("#ErrorArea").html("");
                        }
                        return true;
                    }else
                    {
                        return false;
                    }
                } else if(result.error.toString() == "Sản phẩm bị trùng.")
                {
                    var message = confirm("Sản phẩm đã có, bạn có muốn cập nhật sản phẩm này?")
                    if(message == true)
                    {
                        if(result.nameDupProduct) {
                            // $("#dupTable_"+result.id).find("td").find("input")[2].value = result.updatedPrice;
                            $('tr:has(td:contains("'+result.nameDupProduct+'"))').find("td")[3].innerHTML = result.updatedPrice;
                            $("#ErrorProduct tr#ErrorProductTD" + index).remove();
                            $("#ErrorArea").html("");
                        }
                        return true;
                    }else
                    {
                        return false;
                    }
                }
                return false;
            }
        }
    });
}
function deleteProduct(id){
    var productId = $("#ProductId" + id).val();
    var message = confirm("Bạn có muốn xóa sản phẩm này?")
    $.ajax({
        type: "DELETE",
        url: '/Admin/Import/DeleteProduct',
        data: { id: id},
        cache: true,
        success: function (result) {
            if(message == true)
            {
                $("#product_"+id).remove();
                return true;
            }else 
            {
                return false;
            }
                    
        }
    });

}
function saveCorrectProduct(products) {

    $('#ProductTable tr').each(function (index) {
        console.log(index);
        $(this).find('td').each(function (i) {
            //do your stuff, you can use $(this) to get current cell
            if (index > 0) {
                if (i == 0) {
                    console.log($(this).text());
                }
                var td = $(this);
                if (td.find('input')) {
                    console.log(td.find('input').val());
                }
            }
        })
    })
}
function setTable(what){
    if(document.getElementById(what).style.display=="none"){
        document.getElementById(what).style.display="block";
    }
    else if(document.getElementById(what).style.display=="block"){
        document.getElementById(what).style.display="none";
    }
}

       

function Product(id,checkbox ,productName, productMarket, price, checked) {
    this.id = id;
    this.checkbox = checkbox;
    this.productName = productName;
    this.productMarket = productMarket;
    this.price = price;
    this.checked = checked;
}

function mergeProduct(i) {
       
    var duplicateTable = $("#table_"+i);
    var listTr = duplicateTable.find("tr");
    var products = [];
    for(var j = 0; j < listTr.length; j++) {
        if(listTr[j].id != 'header_'+i) {
            var cells = listTr[j].cells;
            for (var l = 0; l < 2; l++) {
                var checkbox = cells[0].childNodes[l].checked;
                if(checkbox == true || checkbox == false)
                {
                    break;
                }
            }
                
            var name = cells[1].innerHTML;
            var market = cells[2].innerHTML;
            var price = cells[3].innerHTML;
            for (var m  = 0; m < 2; m++) {
                var checked = cells[4].childNodes[m].checked;
                if(checked == true|| checked == false)
                {
                    break;
                }
            }
            if(checkbox == true){
                var product = new Product(j,checkbox,name,market,price,checked);
                products.push(product);
            }
        }
    }
    if(products.length < 2)
    {
        //  alert("Vui lòng chọn ít nhất 2 sản phẩm.");
        $().toastmessage('showNoticeToast', '<div style="font-size:16px"><div style="text-align:center">Vui lòng chọn ít nhất 2 sản phẩm.</div></div>');
    } else
    {
        var testChecked = false;
        for (var c = 0; c < products.length; c++) {
            if(products[c].checked == false)
            {
                testChecked = false;
            } else 
            {
                testChecked = true;
                break;
            }
        }
        if(testChecked == false)
        {
            //   alert("Vui lòng chọn giá của sản phẩm đã chọn.");
            $().toastmessage('showNoticeToast', '<div style="font-size:16px"><div style="text-align:center">"Vui lòng chọn giá của sản phẩm đã chọn.</div></div>');
        } else {
            var productName = "";
            var productMarket = "";
            var productPrice;
            var nonstop = true;
            for(var n = 0; n < products.length && nonstop; n++) {
                if(products[n].checked) {
                    var temp = products[0];
                    products[0] = products[n];
                    products[n] = temp;
                    nonstop = false;
                }
            }
            for(var k = 0; k < products.length; k++) {
                if (k != products.length) {
                    productName += products[k].productName + ";";

                } else {
                    productName += products[k].productName;
                }
                productMarket = products[k].productMarket;
                if (products[k].checked) {
                    productPrice = products[k].price;
                }
            }
                
            var finalProduct = new Product(0, productName, productMarket, productPrice, true);
                    
            var id = parseInt($('#ProductTable tr:last #STT').html());
            $.ajax({
                type: "POST",
                url: '/Admin/Import/UpdateSession',
                data: { ProductId: id, ProductName: productName, ProductMarketName: productMarket, ProductPrice: productPrice },
                cache: true,
                success: function (newId) {
                    var id = newId;
                    var stt = parseInt($('#ProductTable tr:last #STT').html()) + 1;
                    $("#ProductTable tr:last").after("<tr id='product_"+id+"'>"+
                                                        "<td id='STT' style='text-align:center'>" + stt + "</td>"+
                                                        "<td>"+productName+"</td>"+
                                                        "<td style='text-align:center'>"+ productMarket +"</td>"+
                                                        "<td style='text-align:center'>" + productPrice +"</td>"+
                                                        "<td style='text-align:center'> <button type='button' class='btn' onclick='deleteProduct("+id+")'>"+
                                                        "<i class='icol-cross'></i>Xóa</button></td>"+
                                                     "</tr>")
                    for (var h = 0; h < products.length; h++) {
                                
                        if(h >0){
                                    
                            if(products[h].id != 1){
                                $("#dupTable_"+i).find("tr")[products[h].id -h].remove();
                            } 
                            else
                            {
                                $("#dupTable_"+i).find("tr")[products[h].id ].remove();
                            }
                        } 
                        else
                        {
                            $("#dupTable_"+i).find("tr")[products[h].id].remove();
                        }
                        if($("#dupTable_"+i).find("tr")[1] == null)
                        {
                            $("#dupTable_"+i).remove();
                        }
                    }
                    //if(listTr.length = 2)
                    //{
                    //    $("#dupTable_"+i).find("tr").find("input:checkbox").attr( 'checked', $( this ).is( ':checkbox' ) ? 'checked' : '' );
                    //    $("#split_"+i).click()
                    //}
                    if($("#dupTable_"+i).find("tr")[1] != null && $("#dupTable_"+i).find("tr")[2] == null)
                    {
                        $("#dupTable_"+i).find("tr").find("input:checkbox").attr( 'checked', $( this ).is( 'checked' ) ? 'checked' : '' );
                        split(i);
                    }
                    
                    if($("#dupTable_"+i).find("tr")[1] == null)
                    {
                        $("#dupTable_"+i).remove();
                    }
                }
            });
                
        }
    }
        
}
    
   
function split(i) 
{
    var duplicateTable = $("#table_"+i);
    var listTr = duplicateTable.find("tr");
    var products = [];
            
    for(var j = 0; j < listTr.length; ++j) {
        if(listTr[j].id != 'header_'+i) {
            var cells = listTr[j].cells;
            //var checkbox = cells[0].childNodes[1].checked;
            for (var l = 0; l < 2; l++) {
                var checkbox = cells[0].childNodes[l].checked;
                if(checkbox == true || checkbox == false)
                {
                    break;
                }
            }
            var name = cells[1].innerHTML;
            var market = cells[2].innerHTML;
            var price = cells[3].innerHTML;
            for (var m  = 0; m < 2; m++) {
                var checked = cells[4].childNodes[m].checked;
                if(checked == true|| checked == false)
                {
                    break;
                }
            }
            if(listTr.length < 4)
            {
                var product = new Product(j,checkbox,name,market,price,checked);
                products.push(product);
            }
            else 
                if(checkbox == true){
                    var product = new Product(j,checkbox,name,market,price,checked);
                    products.push(product);
                }
        }
    }
    if(products.length < 1)
    {
        //  alert("Vui lòng chọn ít nhất 1 sản phẩm để tách.");
        $().toastmessage('showNoticeToast', '<div style="font-size:16px"><div style="text-align:center">Vui lòng chọn ít nhất 1 sản phẩm để tách.</div></div>');
    } 
    else {
        var id = parseInt($('#ProductTable tr:last #STT').html());
        for (var k = 0; k < products.length; k++) 
        {
            $.ajax({
                type: "POST",
                url: '/Admin/Import/UpdateSession',
                data: { ProductId: id, ProductName: products[k].productName, ProductMarketName: products[k].productMarket, ProductPrice: products[k].price },
                cache: true,
                success: function (result) {
                       
                    var id = result.id;
                    var stt = parseInt($('#ProductTable tr:last #STT').html()) + 1;
                    $("#ProductTable tr:last").after("<tr id='product_"+id+"'>"+
                                                        "<td id='STT' style='text-align:center'>" + stt + "</td>"+
                                                        "<td>"+ result.correctProductName+"</td>"+
                                                        "<td style='text-align:center'>"+ result.correctMarketName +"</td>"+
                                                        "<td style='text-align:center'>" + result.correctProductPrice +"</td>"+
                                                        "<td style='text-align:center'> <button type='button' class='btn' onclick='deleteProduct("+id+")'>"+
                                                        "<i class='icol-cross'></i>Xóa</button></td>"+
                                                     "</tr>")
                }
            });
            if(k >0)
            {
                //if(products[k].id != 1 ){
                                  
                //    $("#dupTable_"+i).find("tr")[products[k].id -k].remove();
                //} 
                //else
                //{
                $("#dupTable_"+i).find("tr")[products[k].id - k].remove();
                //}
            } 
            else
            {
                $("#dupTable_"+i).find("tr")[products[k].id].remove();
            }
        }
    }
    if($("#dupTable_"+i).find("tr")[1] != null && $("#dupTable_"+i).find("tr")[2] == null)
    {
        $("#dupTable_"+i).find("tr").find("input:checkbox").attr( 'checked', $( this ).is( 'checked' ) ? 'checked' : '' );
        split(i);
    }
                    
    if($("#dupTable_"+i).find("tr")[1] == null)
    {
        $("#dupTable_"+i).remove();
    }
}
function mergeProduct1(i) {
       
    var duplicateTable = $("#dupTable_"+i);
    var listTr = duplicateTable.find("tr");
    var products = [];
    for(var j = 0; j < listTr.length; j++) {
        if(listTr[j].id != 'header_'+i) {
            var cells = listTr[j].cells;
            for (var l = 0; l < 2; l++) {
                var checkbox = cells[0].childNodes[l].checked;
                if(checkbox == true || checkbox == false)
                {
                    break;
                }
            }
                
            var name = cells[1].innerHTML;
            var market = cells[2].innerHTML;
            var price = cells[3].innerHTML;
            for (var m  = 0; m < 2; m++) {
                var checked = cells[4].childNodes[m].checked;
                if(checked == true|| checked == false)
                {
                    break;
                }
            }
            if(checkbox == true){
                var product = new Product(j,checkbox,name,market,price,checked);
                products.push(product);
            }
        }
    }
    if(products.length < 2)
    {
        //    alert("Vui lòng chọn ít nhất 2 sản phẩm.")
        $().toastmessage('showNoticeToast', '<div style="font-size:16px"><div style="text-align:center">Vui lòng chọn ít nhất 2 sản phẩm.</div></div>');

    } else
    {
        var testChecked = false;
        for (var c = 0; c < products.length; c++) {
            if(products[c].checked == false)
            {
                testChecked = false;
            } else 
            {
                testChecked = true;
                break;
            }
        }
        if(testChecked == false)
        {
            //   alert("Vui lòng chọn giá của sản phẩm đã chọn.")
            $().toastmessage('showNoticeToast', '<div style="font-size:16px"><div style="text-align:center">Vui lòng chọn giá của sản phẩm đã chọn.</div></div>');

        } else {
            var productName = "";
            var productMarket = "";
            var productPrice;
            var nonstop = true;
            for(var n = 0; n < products.length && nonstop; n++) {
                if(products[n].checked) {
                    var temp = products[n];
                    products[n] = products[0];
                    products[0] = temp;
                    nonstop = false;
                }
            }
            for(var k = 0; k < products.length; k++) {
                if (k != products.length) {
                    productName += products[k].productName + ";"

                } else {
                    productName += products[k].productName;
                }
                productMarket = products[k].productMarket;
                if (products[k].checked) {
                    productPrice = products[k].price;
                }
            }
                
            var finalProduct = new Product(0,checkbox, productName, productMarket, productPrice, true);
                    
            var id = parseInt($('#dupSellProductTable tr:last #STT').html());
                
            $.ajax({
                type: "POST",
                url: '/Admin/Import/UpdateSession',
                data: { ProductId: id, ProductName: productName, ProductMarketName: productMarket, ProductPrice: productPrice },
                cache: true,
                success: function (result) {
                    var id = result.id;
                    var stt = parseInt($('#dupSellProductTable tr:last #STT').html()) + 1;
                    if(stt.toString() == "NaN")
                    {
                        stt = 1;
                    }
                       
                    $("#dupSellProductTable tr:last").after("<tr id='product_"+id+"'>"+
                                                        "<td id='STT' style='text-align:center'>" + stt + "</td>"+
                                                        "<td>"+ result.correctProductName+"</td>"+
                                                        "<td style='text-align:center;'>"+ result.correctMarketName +"</td>"+
                                                        "<td style='text-align:center;'>" + result.correctProductPrice +"</td>"+
                                                        "<td style='text-align:center;'> <button type='button' class='btn' onclick='deleteProduct("+id+")'>"+
                                                        "<i class='icol-cross'></i>Xóa</button></td>"+
                                                     "</tr>")
                    // var testChecked = false;
                    for (var h = 0; h < products.length; h++) {
                                
                        if(h >0){
                                    
                            if(products[h].id != 1){
                                $("#dupTable_"+i).find("tr")[products[h].id -h].remove();
                            } 
                            else
                            {
                                $("#dupTable_"+i).find("tr")[products[h].id ].remove();
                            }
                        } 
                        else
                        {
                            $("#dupTable_"+i).find("tr")[products[h].id].remove();
                        }
                        if($("#dupTable_"+i).find("tr")[1] == null)
                        {
                            $("#dupTable_"+i).remove();
                        }
                    }
                    if(listTr.length = 2)
                    {
                        $("#dupTable_"+i).find("tr").find("input:checkbox").attr( 'checked', $( this ).is( 'checked' ) ? 'checked' : '' );
                        $("#split_"+i).click()
                    }
                    $("#MessageArea").html("");
                }
            });
                
        }
    }
        
}
function split1(i) 
{
    var duplicateTable = $("#table_"+i);
    var listTr = duplicateTable.find("tr");
    var products = [];
            
    for(var j = 0; j < listTr.length; ++j) {
        if(listTr[j].id != 'header_'+i) {
            var cells = listTr[j].cells;
            //var checkbox = cells[0].childNodes[1].checked;
            for (var l = 0; l < 2; l++) {
                var checkbox = cells[0].childNodes[l].checked;
                if(checkbox == true || checkbox == false)
                {
                    break;
                }
            }
            var name = cells[1].innerHTML;
            var market = cells[2].innerHTML;
            var price = cells[3].innerHTML;
            for (var m  = 0; m < 2; m++) {
                var checked = cells[4].childNodes[m].checked;
                if(checked == true|| checked == false)
                {
                    break;
                }
            }
            if(listTr.length < 4)
            {
                var product = new Product(j,checkbox,name,market,price,checked);
                products.push(product);
            }
            else 
                if(checkbox == true){
                    var product = new Product(j,checkbox,name,market,price,checked);
                    products.push(product);
                }
        }
    }
    if(products.length < 1)
    {
        //   alert("Vui lòng chọn ít nhất 1 sản phẩm để tách.")
        $().toastmessage('showNoticeToast', '<div style="font-size:16px"><div style="text-align:center">Vui lòng chọn ít nhất 1 sản phẩm để tách.</div></div>');

    } 
    else {
        var id = parseInt($('#dupSellProductTable tr:last #STT').html());
        for (var k = 0; k < products.length; k++) 
        {
            $.ajax({
                type: "POST",
                url: '/Admin/Import/UpdateSession',
                data: { ProductId: id, ProductName: products[k].productName, ProductMarketName: products[k].productMarket, ProductPrice: products[k].price },
                cache: true,
                success: function (result) {
                       
                    var id = result.id;
                    var stt = parseInt($('#dupSellProductTable tr:last #STT').html()) + 1;
                    if(stt.toString() == "NaN")
                    {
                        stt = 1;
                    }
                    $("#dupSellProductTable tr:last").after("<tr id='product_"+id+"'>"+
                                                        "<td id='STT' style='text-align:center'>" + stt + "</td>"+
                                                        "<td>"+ result.correctProductName+"</td>"+
                                                        "<td style='text-align:center;'>"+ result.correctMarketName +"</td>"+
                                                        "<td style='text-align:center;'>" + result.correctProductPrice +"</td>"+
                                                        "<td style='text-align:center;'> <button type='button' class='btn' onclick='deleteProduct("+id+")'>"+
                                                        "<i class='icol-cross'></i>Xóa</button></td>"+
                                                     "</tr>")
                }
            });
                
            if(k >0)
            {
                if(products[k].id != 1){
                                  
                    $("#dupTable_"+i).find("tr")[products[k].id -k].remove();
                } 
                else
                {
                    $("#dupTable_"+i).find("tr")[products[k].id].remove();
                }
            } 
            else
            {
                $("#dupTable_"+i).find("tr")[products[k].id].remove();
            }
                        
            if($("#dupTable_"+i).find("tr")[1] == null)
            {
                $("#dupTable_"+i).remove();
            }
        }
    }
    $("#MessageArea").html("");
}

function mergeAll(i)
{
    //    var countTable = $("#fb").find("table").size();
    //    for (var i = 0; i < countTable; i++) 
    //    {
    //        //$("#fb").find("#dupTable_"+i).find("input:checkbox")[0].click();
    //        //$("#fb").find("#dupTable_"+i).find("#combine_"+i).click();
    //        $("#fb").find("#checkAll").click();
    //        $('button[value="Gộp"]').click() 
    //    }
    $("#fb").find("input:checkbox").click();
    $('button[value="Gộp"]').click()
}

function splitAll(i)
{
    //var countTable = $("#fb").find("table").size();
    //for (var i = 0; i < countTable; i++) 
    //{
    //    $("#fb").find("#dupTable_"+i).find("input:checkbox")[0].click();
    //    $("#fb").find("#dupTable_"+i).find("#split_"+i).click();
            
    //}
    $("#fb").find("input:checkbox").click();
    $('button[value="Tách"]').click()
}
function saveFile()
{
    $.ajax({
        type: "POST",
        url: '/Admin/Import/exportTxt',
        data: {},
        method: 'json',
        cache: true,
        success: function (message) {
            //  alert(message);
            $().toastmessage('showSuccessToast', '<div style="font-size:16px"><div style="text-align:center">'+message+'</div></div>');
        }
    });
}
function checkboxChecked(idCheckbox)
{
    if($("#"+idCheckbox).find("input:checkbox")[0].checked == false)
    {
        $("#"+idCheckbox).parent('tr').removeClass("checked");
        $("#"+idCheckbox).find("input:checkbox").removeAttr('checked');
    }
    else if($("#"+idCheckbox).find("input:checkbox")[0].checked == true)
    {
        $("#"+idCheckbox).parent('tr').attr("class", "checked");
        $("#"+idCheckbox).find("input:checkbox").attr("class","checked");
    }
}
function checkboxAllTable(i)
{
    if($("#checkboxAllTable_"+i).find("input:checkbox")[0].checked == true)
    {
        $("#table_"+i).find("tbody").find("input:checkbox").attr('checked', $( this ).is( '' ) ? 'checked' : '' );
        $("#table_"+i).find("tbody").find("tr").attr("class", "checked");
    }
    else
    {
        $("#table_"+i).find("tbody").find("input:checkbox").removeAttr('checked');
        $("#table_"+i).find("tbody").find("tr").removeClass('checked');
    }
}
