(function (visma, describe, it, expect) {
    "use strict";

    describe("Domain", function () {

        it("Card should print toString", function () {
            var card = new visma.Card(visma.Card.suits[0], visma.Card.values[0]);
            expect(card.toString()).toBe("[Object Card<hearts, 1>]");
        });

        it("Card should have suits", function () {
            expect(visma.Card.suits[0]).toBe("hearts");
        });


        it("Card should have values", function () {
            expect(visma.Card.values[0]).toBe(1);
        });
    });

})(visma, describe, it, expect);

