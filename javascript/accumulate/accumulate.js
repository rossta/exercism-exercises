function accumulate(collection, accumulator) {
  const result = []

  for(let i = 0; i < collection.length; i++) {
    result.push(accumulator(collection[i]))
  }

  return result
}

module.exports = accumulate
