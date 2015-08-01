(ns bob)

(defn all-caps? [prompt]
  (and (re-matches #".*[A-Z].*" prompt)
       (re-matches #"^[A-Z\d[^\w]]+$" prompt)))

(defn silence? [prompt]
  (re-matches #"^\s*$" prompt))

(defn ends-with? [prompt c]
  (= (last prompt) c))

(defn response-for [prompt]
  (cond
    (silence? prompt) "Fine. Be that way!"
    (all-caps? prompt) "Whoa, chill out!"
    (ends-with? prompt \!) "Whatever."
    (ends-with? prompt \?) "Sure."
    :else "Whatever."))
