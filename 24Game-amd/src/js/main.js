
(function(){
    "use strict";
    require.config({
        "baseUrl" : "js",
        "paths": {
            "jquery": "../lib/jquery/jquery-2.1.0.min",
            "touchPunch": "lib/touchPunch/touchPunch.min",
            "jQueryTouchPunch": "../lib/touchPunch/jquery.ui.touch-punch.min",
            "jQueryUi": "../lib/jquery-ui/js/jquery-ui-1.10.3.custom.min"

        },
        "shim": {
            "jquery": {
                "exports": "jquery"
            },
            "jQueryTouchPunch": {
                deps: ["jquery"],
                "exports": "jquery"
            },
            "jQueryUi": {
                deps: ["jquery"],
                "exports": "jquery"
            }
        }
    });
    define(['app', 'jquery', 'jQueryTouchPunch', 'jQueryUi'], function (app, jQuery) {
        app.main(jQuery(".container"));
    });
})();


