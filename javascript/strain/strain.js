function keep(collection, callback) {
  let item
  const result = []
  for(let i = 0; i < collection.length; i++) {
    item = collection[i]
    if (callback(item)) {
      result.push(collection[i])
    }
  }

  return result
}

function discard(collection, callback) {
  return keep(collection, negate(callback))
}

function negate(callback) {
  return function(item) {
    return !callback(item)
  }
}

module.exports = {
  keep,
  discard
}
