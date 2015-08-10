(ns beer-song
  (:require [clojure.string :as str]))

(def go-to-store
  "Go to the store and buy some more, 99 bottles of beer on the wall.")

(defn- bottle [num]
  (condp = num
    0 "no more bottles"
    1 "1 bottle"
    (str num " bottles")))

(defn- take-one-down [num]
  (str "Take "
       (if (= num 1) "it" "one")
       " down and pass it around, "
       (bottle (dec num))
       " of beer on the wall."))

(defn- verse-end [num]
  (if (zero? num)
    go-to-store
    (take-one-down num)))

(defn- verse-start [num]
  (str (str/capitalize (bottle num)) " of beer on the wall, "
       (bottle num) " of beer."))

(defn verse [num]
  (str (verse-start num) "\n" (verse-end num) "\n"))

(defn sing
  ([start end]
   (str/join "\n" (map verse (range start (dec end) -1))))
  ([start]
   (sing start 0)))
