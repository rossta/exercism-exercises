'use strict';

function Isogram(text) {
  this.text = text;
}

Isogram.prototype.isIsogram = function() {
  const chars = this.text.toLowerCase().replace(/[\-\s]+/g, '');
  const set = new Set(chars.split(''));
  return chars.length === set.size;
}

module.exports = Isogram;
