(function (Card, describe, it, expect) {
    "use strict";

    describe("Domain", function () {

        it("Card should print toString", function () {
            var card = new Card(Card.suits[0], Card.values[0]);
            expect(card.toString()).toBe("[Object Card<hearts, 1>]");
        });

        it("Card should have suits", function () {
            expect(Card.suits[0]).toBe("hearts");
        });


        it("Card should have values", function () {
            expect(Card.values[0]).toBe(1);
        });
    });

})(visma.Card, describe, it, expect);

