'use strict';

const NUMERALS = {
  1: 'I',
  4: 'IV',
  5: 'V',
  9: 'IX',
  10: 'X',
  40: 'XL',
  50: 'L',
  90: 'XC',
  100: 'C',
  400: 'CD',
  500: 'D',
  900: 'CM',
  1000: 'M'
}

function toRoman(number) {
  if (number <= 0) return '';

  const max = maxNumeralNumber(number);

  return NUMERALS[max] + toRoman(number - max);
}

function maxNumeralNumber(number) {
  return Math.max(...Object.keys(NUMERALS).filter((int) => {
    return int <= number;
  }));
}

module.exports = toRoman;
