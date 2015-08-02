(ns word-count
  (:require [clojure.string :as str]))

(defn- normalize-text [text]
  (str/lower-case (str/replace text #"[^\w]" " ")))

(defn word-count [text]
  (frequencies (str/split (normalize-text text) #"\s+")))
