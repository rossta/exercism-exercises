module Bob exposing (hey)

import Regex

hey : String -> String
hey greeting =
  if isSilent greeting then
     "Fine. Be that way!"

  else if isShouting greeting then
    "Whoa, chill out!"

  else if isQuestion greeting then
    "Sure."

  else
    "Whatever."

isSilent : String -> Bool
isSilent text =
  String.trim text == ""

isShouting : String -> Bool
isShouting text =
  String.toUpper text == text && Regex.contains (Regex.regex "[A-Za-z]+") text

isQuestion : String -> Bool
isQuestion text =
  String.endsWith "?" text
