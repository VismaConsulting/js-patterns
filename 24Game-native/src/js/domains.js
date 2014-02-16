/**
 * Collection of domain classes
 */

function Card(suit, value) {
    this.suit = suit;
    this.value = value;
}
Card.prototype.toString = function () {
    return "[Object Card<" + this.suit + ", " + this.value + ">]"
};
Card.suits = ["hearts", "diamonds", "clubs", "spades"];
Card.values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10
//    ,11, 12, 13
];

function CardImage(card) {
    var imgagePath = "../img/classig-playing-cards.png"



}