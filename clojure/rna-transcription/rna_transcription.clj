(ns rna-transcription)

(defn- transcribe-base [base]
  (case base
    \G \C
    \C \G
    \A \U
    \T \A
    (assert false)))

(defn to-rna [dna]
  (apply str (map transcribe-base dna)))
