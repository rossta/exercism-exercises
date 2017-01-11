const alphabet = "abcdefghijklmnopqrstuvwxyz"
const alphabetChars = alphabet.split("")
const reversedChars = alphabet.split("").reverse()

const atbash = alphabetChars.reduce((result, char, i) => {
  result[char] = reversedChars[i]
  return result
}, {})

function encode(input) {
  return input
    .replace(/\,\./g, "")
    .replace(/[^\w]+/g, "")
    .toLowerCase()
    .split("")
    .reduce(transpose, "")
    .trim()
}

function transpose(output, char, i) {
  return output +
    atbashChar(char) +
    atbashSpacer(i)
}

function atbashChar(char) {
  return atbash[char] || char
}

function atbashSpacer(i) {
  return ((i+1) % 5 == 0) ? " " : ""
}

module.exports = {
  encode
}
