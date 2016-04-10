'use strict';

class Buffer {
  constructor(size) {
    this.size = size;
    this.clear();
  }

  write(item) {
    if (!item) return;
    if (this.isFull()) throw new bufferFullException();
    this.data.push(item);
  }

  read() {
    if (!this.data.length) {
      throw new bufferEmptyException();
    }

    return this.data.shift();
  }

  clear() {
    this.data = [];
  }

  forceWrite(item) {
    if (this.isFull()) {
      this.data = this.data.slice(1);
    }
    this.write(item);
  }

  isFull() {
    return this.data.length >= this.size;
  }
}

function circularBuffer(size) {
  return new Buffer(size);
}

function bufferEmptyException() {}
function bufferFullException() { }

module.exports = {
  circularBuffer,
  bufferEmptyException,
  bufferFullException,
};
