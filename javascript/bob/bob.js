//
// This is only a SKELETON file for the "Bob" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Bob = function() {};

Bob.prototype.hey = function(input) {
  if (isShouting(input)) {
    return 'Whoa, chill out!';
  }
  if (isQuestion(input)) {
    return 'Sure.';
  }
  if (isSilence(input)) {
    return 'Fine. Be that way!';
  }
  return 'Whatever.';
};

function isShouting(input) {
  return input.toUpperCase() === input && input.match(/[A-Za-z]+/);
}

function isQuestion(input) {
  return input.slice(-1) === '?';
}

function isSilence(input) {
  return input.match(/^\s*$/);
}

module.exports = Bob;
