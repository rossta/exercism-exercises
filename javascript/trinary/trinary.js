class Trinary {
  constructor(value) {
    this.value = value;
  }

  toDecimal() {
    return this.value.
      replace(/[^012]/g, "").
      split('').
      reverse().
      reduce((total, num, factor) => {
        return total + (parseInt(num, 10) * Math.pow(3, factor))
      }, 0)
  }
}

module.exports = Trinary
