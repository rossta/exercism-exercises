module Pangram exposing (isPangram)

import Set


alphabet =
    "abcdefghijklmnopqrstuvwxyz"
        |> String.toList
        |> Set.fromList


isPangram : String -> Bool
isPangram text =
    text
        |> String.toLower
        |> String.toList
        |> Set.fromList
        |> Set.intersect alphabet
        |> (==) alphabet
