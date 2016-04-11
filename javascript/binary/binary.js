'use strict';

class Binary {
  constructor(digits) {
    this.digits = stringToDigitList(digits);
  }

  toDecimal() {
    return binaryListToDecimal(this.digits, 0);
  }
}

function stringToDigitList(digitString) {
  if (digitString.match(/[^0|1]/)) { return []; }

  return digitString.split('').map((d) => parseInt(d, 10));
}

function binaryListToDecimal(digits) {
  return digits.reduce(addBinaryDigits, 0);
}

function addBinaryDigits(sum, digit, index, digits) {
  if (digit === 1) {
    let power = digits.length - index - 1;
    sum = sum + Math.pow(2, power);
  }
  return sum;
}

module.exports = Binary;
