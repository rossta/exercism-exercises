'use strict';

const BigInt = require('./big-integer');

class Grains {
  square(num) {
    return power(num-1).toString();
  }

  total() {
    return power(64).subtract(1).toString();
  }
}

function power(num) {
  return BigInt(2).pow(num);
}

module.exports = Grains;
