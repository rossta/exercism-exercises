var BeerSong = function() {};

BeerSong.prototype.sing = function(startCount, endCount) {
  endCount = endCount || 0;
  var firstVerse = this.verse(startCount);
  if (startCount > endCount) {
    return firstVerse + "\n" + this.sing(startCount-1, endCount);
  }
  return firstVerse;
}

BeerSong.prototype.verse = function(count) {
  var lines = [];
  lines.push(phraseStartVerse(count));
  lines.push(phraseFinishVerse(count));
  return lines.join("\n") + "\n";
};

function phraseStartVerse(count) {
  var numberOfBottles = phraseNumberOfBottles(count);
  return (capitalize(numberOfBottles)
          + " on the wall, "
          + numberOfBottles
          + ".");
}

function phraseFinishVerse(count) {
  return (phraseTakeOneDown(count)
          + phraseNumberOfBottles(count - 1)
          + " on the wall.");
}

function phraseTakeOneDown(count) {
  if (count) {
    return "Take " + phraseOneBottle(count) + " down and pass it around, ";
  } else {
    return "Go to the store and buy some more, ";
  }
}

function phraseOneBottle(count) {
  if (count === 1) {
    return "it";
  }

  return "one";
}

function phraseNumberOfBottles(count) {
  var howMany = phraseBottleCount(count);
  var bottles = pluralize("bottle", count);

  return howMany + " " + bottles + " of beer";
}

function phraseBottleCount(count) {
  if (count < 0) {
    return 99;
  } else if (count) {
    return count;
  } else {
    return "no more";
  }
}

function pluralize(text, count) {
  if (count === 1) {
    return text;
  }

  return text + "s";
}

function capitalize(string) {
  return string.charAt(0).toUpperCase() + string.slice(1);
}

module.exports = BeerSong;
