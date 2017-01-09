module Accumulate exposing (accumulate)


accumulate : (a -> a) -> List a -> List a
accumulate fun list =
    case list of
        [] ->
            list

        first :: rest ->
            fun first :: accumulate fun rest
