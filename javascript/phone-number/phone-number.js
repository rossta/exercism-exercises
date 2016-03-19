var PhoneNumber = function(raw) {
  this.raw = raw;
};

var INVALID = '0000000000';

PhoneNumber.prototype.number = function() {
  var clean = this.raw.replace(/[^\d]+/g, '')
  if (clean.length == 11) {
    if (clean[0] !== '1') return INVALID;
    clean = clean.slice(1);
  } else if (clean.length < 10) {
    return INVALID;
  }
  return clean;
};

PhoneNumber.prototype.areaCode = function() {
  return phoneNumberParts(this.number()).areaCode;
};

PhoneNumber.prototype.toString = function() {
  var parts = phoneNumberParts(this.number());
  return ('('
          + parts.areaCode
          + ') '
          + parts.firstThree
          + '-'
          + parts.lastFour);
};

function phoneNumberParts(number) {
  return {
    areaCode: number.slice(0, 3),
    firstThree: number.slice(3, 6),
    lastFour: number.slice(6, 10)
  };
}

module.exports = PhoneNumber;
