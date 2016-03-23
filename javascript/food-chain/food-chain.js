var FoodChain = function() {};

var fly = animalVerse([
  'I know an old lady who swallowed a fly.'
], [
  'I don\'t know why she swallowed the fly. Perhaps she\'ll die.'
]);

var spider = animalVerse([
  'I know an old lady who swallowed a spider.',
  'It wriggled and jiggled and tickled inside her.'
], [
  'She swallowed the spider to catch the fly.'
]);

var cat = animalVerse([
  'I know an old lady who swallowed a cat.',
  'Imagine that, to swallow a cat!'
], [
  'She swallowed the cat to catch the bird.'
]);

var bird = animalVerse([
  'I know an old lady who swallowed a bird.',
  'How absurd to swallow a bird!'
], [
  'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.'
]);

var dog = animalVerse([
  'I know an old lady who swallowed a dog.',
  'What a hog, to swallow a dog!'
], [
  'She swallowed the dog to catch the cat.'
]);

var goat = animalVerse([
  'I know an old lady who swallowed a goat.',
  'Just opened her throat and swallowed a goat!'
], [
  'She swallowed the goat to catch the dog.',
]);

var cow = animalVerse([
  'I know an old lady who swallowed a cow.',
  'I don\'t know how she swallowed a cow!',
], [
  'She swallowed the cow to catch the goat.'
]);

var horse = animalVerse([
  'I know an old lady who swallowed a horse.'
], [
  'She\'s dead, of course!'
]);

var CHAIN = [
  horse,
  cow,
  goat,
  dog,
  cat,
  bird,
  spider,
  fly,
];

FoodChain.prototype.verses = function(start, finish) {
  var result = '';
  for (var i = start; i <= finish; i++) {
    result += this.verse(i) + '\n';
  }
  return result;
};

FoodChain.prototype.verse = function(num) {
  return verseParts(num).
    reduce(function(parts, fn, index) {
      return fn(parts, index);
    }, []).join("\n") + '\n';
};

function verseParts(num) {
  if (num == CHAIN.length) {
    return CHAIN.slice(0, 1);
  } else {
    return CHAIN.slice(CHAIN.length-num)
  }
}

function animalVerse(openings, closings) {
  return function(parts, secondary) {
    if (!secondary) {
      openings.forEach(function(part) { parts.push(part); });
    }
    closings.forEach(function(part) { parts.push(part); });
    return parts;
  }
}

module.exports = FoodChain;
