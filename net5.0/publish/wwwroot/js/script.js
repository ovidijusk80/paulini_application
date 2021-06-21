function incEltNbr(id, endNbr) {
    var $el = $("#" + id);

    $({ value: 0 }).stop(true).animate({ value: endNbr }, {
        duration: 5000,
        easing: "easeOutExpo",
        step: function () {
            // percentage with 1 decimal;
            var percentageVal = Math.round(this.value * 1);

            $el.text(percentageVal);
        }
    }).promise().done(function () {
        // hard set the value after animation is done to be
        // sure the value is correct
        $el.text(endNbr);
    });

}

function iframeHandler() {
    var text = document.getElementById("iframeContent").innerHTML;
    document.querySelector('iframe').contentDocument.write(text);
    var iframe = document.querySelector('iframe');
    iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
}

function DisplayBasketToggle() {
    var cart = document.getElementById("product-category-button-div");
    if (cart.classList.contains("hidden")) {
        document.getElementById("cart-basket-overlay").classList.add("reduce-position");
    } else {
        document.getElementById("cart-basket-overlay").classList.remove("reduce-position");
    }
    document.getElementById("cart-basket-overlay").classList.toggle("show");
    document.getElementById("cart-overlay").classList.toggle("show");
}

$(document).ready(function () {
    $(document).on('click', '.category-select-button .product-category-button', function (e) {
        e.preventDefault();
        var category = $(this).attr("slug");

        if ($(this).hasClass("active")) {
            $(".product-category-button.active").removeClass("active");
            $("ul.clothes-select li.search_filter").filter(function () {
                $(this).show();
            });
        } else {
            $(".product-category-button.active").removeClass("active");
            $(this).addClass("active");
            if (category != "") {
                $("ul.clothes-select li.search_filter").filter(function () {
                    $(this).toggle($(this).attr("categories").toLowerCase().indexOf(category) > -1);
                });
                var mini = $(".mini-category-select");
                mini.addClass("active");
                mini.text($(this).text());
                $(".product-category-button-div").addClass("hidden");
            }
        }
        return false;
    });

    $(document).on('click', '.mini-category-select.active', function (e) {
        $(".product-category-button-div").removeClass("hidden");
        $(this).removeClass("active");
        $(".product-category-button.active").removeClass("active");
        $("ul.clothes-select li.search_filter").filter(function () {
            $(this).show();
        });
    });
    $(document).on('click', '#responsive-button', function (e) {
        console.log("TEST");
        $('.responsive-navigation').toggle();
    });
    $(document).on('click', '.responsive-button', function (e) {
        console.log("TEST1");
        $('.responsive-navigation').toggle();
    });

    //$('.responsive-button').click(function () {
    //    $('.responsive-navigation').stop().toggle();
    //    return false;
    //});
    //$('.responsive-button').click(function () {
    //    console.log("Test");
    //    $('.responsive-navigation').toggle();
    //    return false;
    //});
});



window.blazorExtensions = {

    WriteCookie: function (name, value, days) {

        var expires;
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = "; expires=" + date.toGMTString();
        }
        else {
            expires = "";
        }
        document.cookie = name + "=" + value + expires + "; path=/";
    }
}

window.WriteCookie = {

    WriteCookie: function (name, value, days) {

        var expires;
        if (days) {
            var date = new Date();
            date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
            expires = "; expires=" + date.toGMTString();
        }
        else {
            expires = "";
        }
        document.cookie = name + "=" + value + expires + "; path=/";
    }
}
window.ReadCookie = {
    ReadCookie: function (cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var ca = decodedCookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }
}