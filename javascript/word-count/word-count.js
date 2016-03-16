var Words = function() {};

Words.prototype.count = function(text) {
  var tokens = text.trim().replace(/\s+/, ' ').split(' ');
  return tokens.reduce(function(counts, word) {
    if (isNaN(counts[word])) {
      counts[word] = 0;
    }
    counts[word] += 1;
    return counts;
  }, {});
};

module.exports = Words;
