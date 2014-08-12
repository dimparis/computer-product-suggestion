$(function () {
    var productScore = $(".product-score");
    var productRatio = $(".product-price-ratio");

    if ($(".product-score").length == 2) {
        var p1 = productScore[0].innerHTML;
        var p1ID = productScore[0].attributes['product-id'].value;
        var p1Ratio = productRatio[0].innerHTML;

        var p2 = productScore[1].innerHTML;
        var p2ID = productScore[1].attributes['product-id'].value;
        var p2Ratio = productRatio[1].innerHTML;

        var p3 = -1
    } else {
        var p1 = productScore[0].innerHTML;
        var p1ID = productScore[0].attributes['product-id'].value;
        var p1Ratio = productRatio[0].innerHTML;

        var p2 = productScore[1].innerHTML;
        var p2ID = productScore[1].attributes['product-id'].value;
        var p2Ratio = productRatio[1].innerHTML;

        var p3 = productScore[2].innerHTML;
        var p3ID = productScore[2].attributes['product-id'].value;
        var p3Ratio = productRatio[2].innerHTML;
    }
    var bestScore = compareProduct(p1, p2, p3);
    var bestRatio = compareProductRatio(p1Ratio, p2Ratio, p3Ratio);

    $(document).ready(function () {
        if ($(".product-score").length == 2) {
            if (p1 == bestScore) {
                $("." + p1ID).addClass("highlighted-table")
            } else if (p2 == bestScore) {
                $("." + p2ID).addClass("highlighted-table")
            };
            if (p1Ratio == bestRatio) {
                $(".price-ratio-" + p1ID).css("background-color", "#F87912")
            } else if (p2Ratio == bestRatio) {
                $(".price-ratio-" + p2ID).css("background-color", "#F87912")
            }

        } else {
            if (p1 == bestScore) {
                $("." + p1ID).addClass("highlighted-table")
            } else if (p2 == bestScore) {
                $("." + p2ID).addClass("highlighted-table")
            }
            else if (p3 == bestScore) {
                $("." + p3ID).addClass("highlighted-table")
            };

            if (p1Ratio == bestRatio) {
                $(".price-ratio-" + p1ID).css("background-color", "#F87912")
            } else if (p2Ratio == bestRatio) {
                $(".price-ratio-" + p2ID).css("background-color", "#F87912")
            } else if (p3Ratio == bestRatio) {
                $(".price-ratio-" + p3ID).css("background-color", "#F87912")
            }
        }
        $(".product-price-required-" + p1ID).text(p1Ratio-bestRatio);
        $(".product-price-required-" + p2ID).text(p2Ratio - bestRatio);
        $(".product-price-required-" + p3ID).text(p3Ratio - bestRatio);
    });
});

function compareProduct(p1, p2, p3) {
    var max = Number(p1);
    if (Number(p2) > max) {
        max = Number(p2);
    };
    if (Number(p3) > max) {
        max = Number(p3);
    }
    return max;
}

function compareProductRatio(p1, p2, p3) {
    var min = Number(p1);
    if (Number(p2) < min) {
        min = Number(p2);
    };
    if (Number(p3) < min) {
        min = Number(p3);
    }
    return min;
}