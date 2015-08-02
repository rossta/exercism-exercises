class Complement
  VERSION = 1

  DNA_TO_RNA = {
    "G" => "C",
    "C" => "G",
    "T" => "A",
    "A" => "U"
  }

  RNA_TO_DNA = DNA_TO_RNA.invert

  def self.of_dna(dna)
    transcribe(dna, DNA_TO_RNA)
  end

  def self.of_rna(rna)
    transcribe(rna, RNA_TO_DNA)
  end

  def self.transcribe(sequence, pairs)
    sequence.chars.map { |base|
      pairs.fetch(base) { raise ArgumentError }
    }.join
  end
end
