describe("Game suite", function () {

    //TODO: use a full deck or without face cards?
    it("should be able to draw cards from a fresh deck", function () {
        var drawFromNewDeck = visma.game.drawFromNewDeck(40);
        expect(drawFromNewDeck.length).toBe(40);
    });

    it("should not be able to draw more then 52 cars", function () {
        expect(function () {
            visma.game.drawFromNewDeck(53)
        }).toThrow("Can't down more cards than the size of the deck");
    });

    it("should eval the answer to 24", function () {
        expect(visma.game.verifyAnswer([new Card("", 9), new Card("", 2), new Card("", 4), new Card("", 1)], "4 + (9 +1)*2")).toBe(true);
    });

    it("should eval the answer and it should not be 24", function () {
        expect(visma.game.verifyAnswer([new Card("", 9), new Card("", 2), new Card("", 4), new Card("", 2)], "4 + (9 +2)*2")).toBe(false);
    });

    it("should cast fault if were missing a number in the answer", function () {
        expect(function () {
            visma.game.verifyAnswer([new Card("", 9), new Card("", 2), new Card("", 4), new Card("", 2)], "4 + (9 +2)")
        }).toThrow("Could not find value [Object Card<, 2>] in answer 4 + (9 +2)");
    });

    it("should cast fault if were missing a card in the answer", function () {
        expect(function () {
            visma.game.verifyAnswer([new Card("", 2), new Card("", 4), new Card("", 2)], "4 + (9 +2 *2)")
        }).toThrow("Missing values in answer 9");
    });

});