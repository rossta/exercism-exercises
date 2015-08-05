(ns beer-song
  (:require [clojure.string :as str]))

(defn pluralize-bottles [num]
  (if (= num 1) "bottle" "bottles"))

(defn describe-bottles [num]
  (if (= num 0) "no more" num))

(defn bottle-phrase [num]
  (str (describe-bottles num)
       " "
       (pluralize-bottles num)))

(defn next-bottles [num]
  (bottle-phrase (dec num)))

(defn current-bottle [num]
  (if (= num 1) "it" "one"))

(defn take-one-down [num]
  (str "Take "
       (current-bottle num)
       " down and pass it around, "
       (next-bottles num)
       " of beer on the wall.\n"))

(def go-to-store
  "Go to the store and buy some more, 99 bottles of beer on the wall.\n")

(defn drink-or-buy [num]
  (if (zero? num)
    go-to-store
    (take-one-down num)))

(defn verse [num]
  (str (str/capitalize (bottle-phrase num)) " of beer on the wall, "
       (bottle-phrase num) " of beer.\n"
       (drink-or-buy num)))

(defn sing [& verses]
  (str/join "\n" (map verse (apply range verses 1))))
