var visma = visma || {};

(function (visma, $) {
    "use strict";

    var $submitAnswerDiv, $gameDiv, $cards, $checkAnswer, $answerValue, $infobox, gameLoop;

    function init() {
        $submitAnswerDiv = $("#submitAnswerDiv");
        $gameDiv = $("#gameDiv");
        $cards = $("#cards");
        $checkAnswer = $("#checkAnswer");
        $answerValue = $("#answerbox");
        $infobox = $("#info");

        gameLoop = new GameLoop(visma.game);

        $("#submitBtn").on("click", function(){
            console.log("got answer", $answerValue.find("span").text());
            gameLoop.answer($answerValue.find("span").text());
            var isCorrect = gameLoop.isCorrectAnswer();
            var timeUsed = gameLoop.timeUsed();
            if (isCorrect) {
                //console.log("correct answer, show the submit form");
                var tidMelding = showMeTheTime(timeUsed);
                $("#showTimeUsed").html("Tid brukt: <span>" + tidMelding + "</span>");
                $("#timeused").val(eval(timeUsed.s + "+" + timeUsed.m + "*60"));
                console.log(timeUsed);
                clearAndSetView("submit");
            } else {
                console.log("wrong answer, restarting the game");
                var feilmelding = "Ai, ai, ai! Feil svar...";
                $infobox.html("<h3>" + feilmelding + "</h3>");
                $infobox.show().delay(2000).fadeOut();
                startGame();
            }
        });

        $("#newgameBtn").on("click", function(){
            startGame();
        });

        $("#howtoplayBtn").on("click", function(){
            $("#howToPlay").slideToggle();
        });
    }

    function startGame() {
        clearAndSetView("game");

        gameLoop.newGame();
        var cards = gameLoop.cards();

        //console.log("cards", cards);
        for (var i = 0; i < cards.length; i++) {
            var $span = $("<span>" + cards[i].value + "</span>");
            $cards.append($("<div class='cardLgBtn " + cards[i].suit + "'></div>").append($span));
        }
        makeItSortable();
    }

    function clearAndSetView(view) {
        console.log("change view ", view);
        if ("game" === view) {
            $checkAnswer.unbind();
            $submitAnswerDiv.hide();
            $gameDiv.show();
            //console.log("game", $submitAnswerDiv);

            $cards.children("div").remove();
            $answerValue.empty();
        } else if ("submit" === view) {
            $submitAnswerDiv.show();
            $gameDiv.hide();
        } else {
            throw "Unknown view";
        }
    }

    function makeItSortable() {
        $("#answerbox").sortable({             
            revert: false,
            receive: function (event, ui) {
                var element = ui.item;
                if(element.hasClass("cardLgBtn")) {
                    element.draggable("option","disabled","true");
                }
                $($(this).data()["ui-sortable"].currentItem[0]).click(function(e) {
                    if(element.hasClass("cardLgBtn")) {
                        element.draggable("enable");
                        $(this).remove();
                    } else {
                        $(this).remove();
                    }
                });

            },
            placeholder: "sortable-placeholder"
        });

        $("#cards").disableSelection();

        $( "#cards div" ).draggable({
          connectToSortable: "#answerbox", 
          helper: "clone",         
          revert: "invalid",
          start: function(event, ui) { 
                $(this).draggable("option", "cursorAt", {
                    left: Math.floor(this.clientWidth / 2),
                    top: Math.floor(this.clientHeight / 2)
                }); 
            }
        });

        $( "#operators div" ).draggable({
          connectToSortable: "#answerbox",
          helper: "clone",
          revert: "invalid",
          start: function(event, ui) { 
                $(this).draggable("option", "cursorAt", {
                    left: Math.floor(this.clientWidth / 2),
                    top: Math.floor(this.clientHeight / 2)
                }); 
            }
        });
    }

    function showMeTheTime(time) {
        var melding = "";
        var numEnding = "er";
        if (time.m > 0) {
            melding += time.m + " minutt";
            melding += time.m < 2 ? " og " : numEnding + " og ";
        }
        melding += time.s + " sekund";
        melding += time.s < 2 ? "." : numEnding + ".";
        return melding;
    }

    visma.app = {
        init: init,
        startGame: startGame
    };

})(visma, jQuery);