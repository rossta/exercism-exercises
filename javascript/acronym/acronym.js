'use strict';

function parse(text) {
  return text.
    split(/[\s-]/).
    map(normalize).
    map(titleize).
    join().
    match(/[A-Z]/g).
    join("");
}

function normalize(text) {
  return text.replace(/[^\w]/g, "");
}

function titleize(text) {
  let first = text.slice(0, 1).toUpperCase();
  let rest  = text.slice(1, text.length);

  if (rest.match(/^[A-Z]+$/)) {
    rest = rest.toLowerCase();
  }

  return first + rest;
}

module.exports = { parse };
