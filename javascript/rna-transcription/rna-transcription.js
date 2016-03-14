var DnaTranscriber = function() {};

var RNA_NUCLEOTIDES = {
  'G': 'C',
  'C': 'G',
  'A': 'U',
  'T': 'A'
};

DnaTranscriber.prototype.toRna = function(dna) {
  var rna = '';
  for (var i = 0; i < dna.length; i++) {
    rna += RNA_NUCLEOTIDES[dna[i]];
  }

  return rna;
};

module.exports = DnaTranscriber;
