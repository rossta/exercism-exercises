'use strict';

function primeFactorsFor(num) {
  return trampoline(() => {
    return primeFactors(num, 2, [])
  });
}

function primeFactors(num, factor, factors) {
  return function() {
    if (num === 1) return factors;

    if (rem(num, factor) === 0) {
      return primeFactors(div(num, factor), 2, factors.concat([factor]));
    } else if (factor === 2) {
      return primeFactors(num, 3, factors);
    } else {
      return primeFactors(num, factor+2, factors);
    }
  }
}

function trampoline(fn) {
  while(fn && typeof fn === 'function') {
    fn = fn()
  }
  return fn;
}

function div(dividend, divisor) {
  return Math.floor(dividend / divisor);
}

function rem(dividend, divisor) {
  return dividend % divisor;
}

module.exports = {for: primeFactorsFor};
