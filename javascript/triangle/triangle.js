'use strict';

class Triangle {
  constructor(a, b, c) {
    this.a = a;
    this.b = b;
    this.c = c;
  }

  kind() {
    const a = this.a;
    const b = this.b;
    const c = this.c;

    assertSides(a, b, c);
    assertInequality(a, b, c);

    return sidesToKinds(a, b, c);
  }
}

const UNIQUE_SIDES_KINDS = {
  1: 'equilateral',
  2: 'isosceles',
  3: 'scalene'
};

function sidesToKinds(a, b, c) {
  return UNIQUE_SIDES_KINDS[uniqueSideCount(a, b, c)];
}

function uniqueSideCount(a, b, c) {
  return new Set([a, b, c]).size;
}

function assertSides(a, b, c) {
  if (a <= 0 || b <= 0 || c <= 0) {
    throw 'Illegal triangle';
  }
}

function assertInequality(a, b, c) {
  const sorted = [a, b, c].sort();
  if (sorted[0] + sorted[1] <= sorted[2]) {
    throw 'Violated triangle inequality';
  }
}

module.exports = Triangle;
