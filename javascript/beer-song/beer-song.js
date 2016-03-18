var BeerSong = function() {};

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
  var howMany;
  var bottles = pluralize("bottle", count);

  if (count < 0) {
    howMany = 99;
  } else if (count) {
    howMany = count;
  } else {
    howMany = "no more";
  }

  return howMany + " " + bottles + " of beer";
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
