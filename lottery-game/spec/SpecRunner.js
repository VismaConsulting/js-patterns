(function() {
    "use strict";

    require.config({
        urlArgs: 'cb=' + Math.random(),
        baseUrl: '../src/js',
        paths: {
            "jquery": '../lib/jquery/jquery-2.1.0.min',
            "jasmine": '../../lib/jasmine-1.3.1/jasmine',
            "jasmine-html": '../../lib/jasmine-1.3.1//jasmine-html',
            "spec": '../../spec/js/'
        },
        shim: {
            jasmine: {
                exports: 'jasmine'
            },
            'jasmine-html': {
                deps: ['jasmine'],
                exports: 'jasmine'
            }
        }
    });

    require(['jquery', 'jasmine-html'], function ($, jasmine) {

        var jasmineEnv = jasmine.getEnv();
        jasmineEnv.updateInterval = 1000;

        var htmlReporter = new jasmine.HtmlReporter();

        jasmineEnv.addReporter(htmlReporter);

        jasmineEnv.specFilter = function (spec) {
            return htmlReporter.specFilter(spec);
        };

        var specs = [];

//        specs.push('js/gameLoopSpec');
        specs.push('spec/24gameSpec');
        specs.push('spec/cardSpec');
        specs.push('spec/gameLoopSpec');



        $(function () {
            require(specs, function (spec) {
                jasmineEnv.execute();
            });
        });

    });

})();
