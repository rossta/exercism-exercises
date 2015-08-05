(ns anagram
  (:require [clojure.string :as string]))

(defn- normalize [text]
  (string/lower-case text))

(defn- anagrams? [a b]
  (let [c (normalize a)
        d (normalize b)]
    (and (not= c d)
         (= (sort c) (sort d)))))

(defn- anagram-for? [a]
  (fn [b] (anagrams? a b)))

(defn anagrams-for [text candidates]
  (filter (anagram-for? text) candidates))
