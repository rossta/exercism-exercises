var Pangram = function(text) {
  this.text = text;
};

var ALPHABET = new Set('abcdefghijklmnopqrstuvwxyz');

Pangram.prototype.isPangram = function() {
  return isLongEnough(this.text) && containsAllLetters(this.text);
};

function isLongEnough(text) {
  return text.length >= ALPHABET.size;
}

function containsAllLetters(text) {
  var textLower = text.toLowerCase();
  for(var letter of ALPHABET) {
    if (!~textLower.indexOf(letter)) {
      return false;
    }
  }

  return true;
}

module.exports = Pangram;
