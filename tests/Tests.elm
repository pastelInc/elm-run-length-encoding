module Tests exposing (..)

import Test exposing (..)
import Expect
import RLE exposing (rle, rle_)


-- Check out http://package.elm-lang.org/packages/elm-community/elm-test/latest to learn more about testing in Elm!


all : Test
all =
    describe "RLE"
        [ describe "rle" <|
              [ test "encode an empty string" <|
                    \_ ->
                    (Expect.equal "" << rle) ""
              , test "encode a kind of string" <|
                  \_ ->
                      (Expect.equal "A3" << rle) "AAA"
              , test "encode many kind of string" <|
                  \_ ->
                      (Expect.equal "A3B2C4A3" << rle) "AAABBCCCCAAA"
              ]
        , describe "rle_" <|
              [ test "encode an empty string" <|
                    \_ ->
                    (Expect.equal "" << rle_) ""
              , test "encode a kind of string" <|
                  \_ ->
                      (Expect.equal "A3" << rle_) "AAA"
              , test "encode many kind of string" <|
                  \_ ->
                      (Expect.equal "A3B2C4A3" << rle_) "AAABBCCCCAAA"
              ]
        ]
