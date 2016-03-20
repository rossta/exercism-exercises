var Anagram = function(subject) {
  this.subject = subject;
};

Anagram.prototype.matches = function(candidates) {
  if (arguments.length > 1) { // support varargs
    candidates = Array.prototype.slice.call(arguments);
  }
  return findAnagrams(this.subject, toArray(candidates));
};

function findAnagrams(subject, candidates) {
  return candidates.filter(function(word) { return isAnagram(subject, word); });
}

function isAnagram(a, b) {
  a = a.toLowerCase();
  b = b.toLowerCase();
  return a !== b && sortWord(a) === sortWord(b);
}

function sortWord(word) {
  return word.split("").sort().join("");
}

function toArray(object) {
  return [].concat(object);
}

module.exports = Anagram;
