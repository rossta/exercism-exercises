(ns rna-transcription)

(defn- transcribe-base [base]
  (cond
    (= \G base) "C"
    (= \C base) "G"
    (= \A base) "U"
    (= \T base) "A"
    :else (throw (AssertionError.  (str "Unrecognized base " base)))))

(defn to-rna [dna]
  (apply str (map transcribe-base dna)))
