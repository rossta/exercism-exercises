'use strict';

const BigInt = require('./big-integer');

class Grains {
  square(num) {
    return BigInt(num).times(num).toString();
  }
}

module.exports = Grains;
