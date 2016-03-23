'use strict';

const DB = new Set();

class Robot {
  constructor() {
    this.reset();
  }

  reset() {
    this.name = generateName();
    DB.add(this.name);
  }
}

const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

function generateName() {
  let name;
  do {
    name = `${randomLetters(2)}${randomNumbers(3)}`;
  } while (DB.has(name));
  return name;
}

function randomLetters(length) {
  let text = '';
  for(let i = 0; i < length; i++) {
    text += letters.charAt(random(letters.length));
  }
  return text;
}

function randomNumbers(length) {
  return random(0xb000000).toString().slice(0, length);
}

function random(max) {
  return Math.floor((Math.random()) * max);
}

module.exports = Robot;

