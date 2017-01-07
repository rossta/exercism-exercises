module Raindrops exposing (raindrops)


raindrops : Int -> String
raindrops count =
    ""
        |> pling count
        |> plang count
        |> plong count
        |> ending count


plong : Int -> String -> String
plong count drops =
    if count % 7 == 0 then
        drops ++ "Plong"
    else
        drops


plang : Int -> String -> String
plang count drops =
    if count % 5 == 0 then
        drops ++ "Plang"
    else
        drops


pling : Int -> String -> String
pling count drops =
    if count % 3 == 0 then
        drops ++ "Pling"
    else
        drops


ending : Int -> String -> String
ending count drops =
    if String.length drops == 0 then
        toString count
    else
        drops
