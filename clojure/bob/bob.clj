(ns bob)

(defn silent? [prompt]
  (re-matches #"^\s*$" prompt))

(defn all-caps? [prompt]
  (re-matches #"^[A-Z\d[^\w]]+$" prompt))

(defn contains-letter? [prompt]
  (re-matches #".*[A-Z].*" prompt))

(defn yelling? [prompt]
  (and (contains-letter? prompt)
       (all-caps? prompt)))

(defn question? [prompt]
  (= (last prompt) \?))

(defn response-for [prompt]
  (cond
    (yelling? prompt) "Whoa, chill out!"
    (question? prompt) "Sure."
    (silent? prompt) "Fine. Be that way!"
    :else "Whatever."))
