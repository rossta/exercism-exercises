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
        x :: y :: z :: _ ->
            if violatesLength x y z then
                Err "Invalid lengths"
            else if violatesInequality x y z then
                Err "Violates inequality"
            else if isEquilateral x y z then
                Ok Equilateral
            else if isIsoceles x y z then
                Ok Isosceles
            else
                Ok Scalene

        _ ->
            Ok Scalene


isEquilateral : Float -> Float -> Float -> Bool
isEquilateral a b c =
    a == b && b == c


isIsoceles : Float -> Float -> Float -> Bool
isIsoceles a b c =
    a == b || b == c


violatesLength : Float -> Float -> Float -> Bool
violatesLength a b c =
    a <= 0 || b <= 0 || c <= 0


violatesInequality : Float -> Float -> Float -> Bool
violatesInequality a b c =
    a + b <= c
