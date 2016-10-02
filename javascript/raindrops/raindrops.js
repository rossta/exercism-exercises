'use strict';

function Raindrops() {}

Raindrops.prototype.convert = function (num) {
  let text = "";

  if (num % 3 === 0) { text += 'Pling' }
  if (num % 5 === 0) { text += 'Plang' }
  if (num % 7 === 0) { text += 'Plong' }
  if (text.length > 0) { return text; }

  return num.toString();
}

module.exports = Raindrops;
