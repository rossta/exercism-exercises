function Crypto(text) {
  this.text = text
}

Crypto.prototype.normalizePlaintext = function() {
  return this.text.toLowerCase().replace(/[^\w]/g, "")
}

Crypto.prototype.plaintextSegments = function() {
  const { cols, rows } = this.dimensions()
  const normalized = this.normalizePlaintext()

  const matcher = new RegExp('.{1,' + cols + '}', 'g')

  return normalized.match(matcher)
}

Crypto.prototype.dimensions = function() {
  const normalized = this.normalizePlaintext()
  const sqrt = Math.sqrt(normalized.length)
  const cols = Math.ceil(sqrt)
  const rows = Math.floor(sqrt)

  return { cols, rows }
}

Crypto.prototype.size = function() {
  return this.dimensions().cols
}

Crypto.prototype.ciphertext = function() {
  const segments = this.plaintextSegments()
  const segmentCharacters = segments.map(s => Array.from(s))

  return zip(...segmentCharacters)
    .map(s => s.join(''))
    .join('')
}

function zip(collectionA, collectionB, ...rest) {
  if (!collectionB) return collectionA

  const zipped = collectionA.map((e, i) => {
    return Array.from(e).concat(collectionB[i])
  })

  return zip(zipped, ...rest)
}

module.exports = Crypto
