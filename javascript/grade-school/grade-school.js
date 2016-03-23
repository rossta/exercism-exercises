'use strict';

class School {
  constructor() {
    this.db = {};
  }

  roster() {
    return this.db;
  }

  add(name, grade) {
    let names = fetch(this.db, grade);
    names.push(name);
    update(this.db, grade, names.sort());
  }

  grade(grade) {
    return fetch(this.db, grade);
  }
}

function fetch(map, key) {
  return map[key] || [];
}

function update(map, key, value) {
  return map[key] = value;
}

module.exports = School;
