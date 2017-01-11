module Triangle exposing (triangleKind, Triangle(..))


version : Int
version =
    2


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind a b c =
    case List.sort [ a, b, c ] of
        x :: y :: z :: [] ->
            if x <= 0 || y <= 0 || z <= 0 then
                Err "Invalid lengths"
            else if x + y <= z then
                Err "Violates inequality"
            else if x == y && y == z then
                Ok Equilateral
            else if x == y || y == z then
                Ok Isosceles
            else
                Ok Scalene

        _ ->
            Ok Scalene
