'use strict';

const fly = animalVerse([
  'I know an old lady who swallowed a fly.'
], [
  'I don\'t know why she swallowed the fly. Perhaps she\'ll die.'
]);

const spider = animalVerse([
  'I know an old lady who swallowed a spider.',
  'It wriggled and jiggled and tickled inside her.'
], [
  'She swallowed the spider to catch the fly.'
]);

const cat = animalVerse([
  'I know an old lady who swallowed a cat.',
  'Imagine that, to swallow a cat!'
], [
  'She swallowed the cat to catch the bird.'
]);

const bird = animalVerse([
  'I know an old lady who swallowed a bird.',
  'How absurd to swallow a bird!'
], [
  'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.'
]);

const dog = animalVerse([
  'I know an old lady who swallowed a dog.',
  'What a hog, to swallow a dog!'
], [
  'She swallowed the dog to catch the cat.'
]);

const goat = animalVerse([
  'I know an old lady who swallowed a goat.',
  'Just opened her throat and swallowed a goat!'
], [
  'She swallowed the goat to catch the dog.',
]);

const cow = animalVerse([
  'I know an old lady who swallowed a cow.',
  'I don\'t know how she swallowed a cow!',
], [
  'She swallowed the cow to catch the goat.'
]);

const horse = animalVerse([
  'I know an old lady who swallowed a horse.'
], [
  'She\'s dead, of course!'
]);

const CHAIN = [
  horse,
  cow,
  goat,
  dog,
  cat,
  bird,
  spider,
  fly,
];

class FoodChain {
  verses(start, finish) {
    let result = '';
    for (let i = start; i <= finish; i++) {
      result += this.verse(i) + '\n';
    }
    return result;
  }

  verse(num) {
    return verseParts(num).
      reduce((parts, fn, index) => {
        return fn(parts, index);
      }, []).join("\n") + '\n';
  }
}

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
      openings.forEach(part => { parts.push(part); });
    }
    closings.forEach(part => { parts.push(part); });
    return parts;
  }
}

module.exports = FoodChain;
