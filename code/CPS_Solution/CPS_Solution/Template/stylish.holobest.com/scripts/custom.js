$(function () {

    //Tu dong an thanh search
    $(window).scroll(function () {
        $(".tabbable").slideUp(500);
        $(".hide-icon").show();
    });

    //Hien thanh search khi hover
    $(".container").on("mouseover", ".hide-icon", function () {
        if ($(".tabbable").css("display") == "none") {
            $(".tabbable").slideDown(500);
            $(".hide-icon").hide();
        } else {
            $(".tabbable").slideUp(500);
        }
    });

    //Hien list san pham khi hover
    $(".list-cart").mouseover(function () {
        $("#compare_panel").show("slide");
        $(".list-cart").hide();
    })

    //Tu dong an list san pham khi mouse out
    $("#compare_panel").mouseleave(function () {
        $("#compare_panel").hide("toggle");
        $(".list-cart").show();
    })

});

//Hien them san pham
var BlockNumber = 2;  //Infinate Scroll starts from second block
var NoMoreData = false;
var inProgress = false;
function clickHere() {
    if (!NoMoreData && !inProgress) {
        inProgress = true;
        $("#loadingDiv").show();
        $("#clickButton").hide();
        $.post(
                "InfinateScrollSearchByName",
                {
                    'BlockNumber': BlockNumber,
                    'searchValue': $('#productName').val()
                },
                function (data) {
                    BlockNumber = BlockNumber + 1;
                    NoMoreData = data.NoMoreData;
                    if (!NoMoreData) {
                        $("#clickButton").show();
                    }
                    $("#loadItemcontainer").append(data.HTMLString);
                    $("#loadingDiv").hide();
                    inProgress = false;
                });
    }
}