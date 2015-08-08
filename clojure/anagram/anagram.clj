(ns anagram
  (:require [clojure.string :as string]))

(defn- normalize [text]
  (string/lower-case text))

(defn- anagrams? [a b]
  (let [c (normalize a)
        d (normalize b)]
    (and (not= c d)
         (= (sort c) (sort d)))))

(defn anagrams-for [text candidates]
  (filter (partial anagrams? text) candidates))
