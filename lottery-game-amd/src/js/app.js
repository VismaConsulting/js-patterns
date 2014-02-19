define(['jquery'], function ( $) {
    "use strict";

    function main($dom) {
        $dom.find(".tada").text("hei");
    }

    return {
        main: main
    };

});