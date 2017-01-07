module Pangram exposing (isPangram)

import Set


alphabet =
    Set.fromList [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ]


isPangram : String -> Bool
isPangram text =
    text
        |> String.toLower
        |> String.split ""
        |> Set.fromList
        |> Set.toList
        |> List.filter inAlphabet
        |> matchesAlphabet


inAlphabet : String -> Bool
inAlphabet char =
    Set.member char alphabet


matchesAlphabet : List String -> Bool
matchesAlphabet chars =
    Set.size alphabet == List.length chars
