'use strict';

const ALLERGENS = [
  'eggs',
  'peanuts',
  'shellfish',
  'strawberries',
  'tomatoes',
  'chocolate',
  'pollen',
  'cats',
];

function Allergies(score) {
  this.score = score;
}

Allergies.prototype.list = function() {;
  return listAllergies(this.score, []);
}

Allergies.prototype.allergicTo = function(allergen) {
  return (this.list().indexOf(allergen) >= 0);
}

function listAllergies(score, list) {
  if (score < 1) { return list; }

  const exponent = Math.floor(Math.log2(score));
  const allergen = ALLERGENS[exponent];

  if (allergen) { list.unshift(allergen); }

  return listAllergies(score - Math.pow(2, exponent), list);
}

module.exports = Allergies;
