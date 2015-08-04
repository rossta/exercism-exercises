(ns anagram
  (:require [clojure.string :as str]))

(defn- normalize [text]
  (str/lower-case text))

(defn- anagrams? [a b]
  (let [c (normalize a)
        d (normalize b)]
    (and (not (= c d))
         (= (frequencies c) (frequencies d)))))

(defn- anagram-for? [a]
  (fn [b] (anagrams? a b)))

(defn anagrams-for [text candidates]
  (filter (anagram-for? text) candidates))
