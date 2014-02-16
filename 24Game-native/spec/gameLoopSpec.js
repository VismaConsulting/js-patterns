(function(visma, describe, it, expect, beforeEach){
    "use strict";

    describe("GameLoop suite", function () {

        var game;

        beforeEach(function () {
            game = jasmine.createSpyObj('game', ['drawFromNewDeck', 'verifyAnswer']);
        });

        it("should be able to time the game when done", function () {
            var gameLoop = new visma.GameLoop(game);
            gameLoop.newGame();

            setTimeout(function () {
                gameLoop.answer("");
                expect(gameLoop.timedUsed()).toBeGreaterThan(4)
            }, 5);
        });

        it("should report correct answer if it is correct", function () {
            game.verifyAnswer.andCallFake(function () {
                return true;
            });

            var gameLoop = new visma.GameLoop(game);
            gameLoop.newGame();
            gameLoop.answer("fake value");

            expect(gameLoop.isCorrectAnswer()).toBe(true);
        });


        it("should report incorrect answer if it is incorrect", function () {
            game.verifyAnswer.andCallFake(function () {
                return false;
            });

            var gameLoop = new visma.GameLoop(game);
            gameLoop.newGame();
            gameLoop.answer("fake value");

            expect(gameLoop.isCorrectAnswer()).toBe(false);
        });


        it("should report incorrect answer if is is in error", function () {
            game.verifyAnswer.andCallFake(function () {
                throw "some message";
            });

            var gameLoop = new visma.GameLoop(game);
            gameLoop.newGame();
            gameLoop.answer("fake value");

            expect(gameLoop.isCorrectAnswer()).toBe(false);
        });

    });
})(visma, describe, it, expect, beforeEach) ;