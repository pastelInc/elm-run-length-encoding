module RLE exposing (rle, rle_)

import List.Extra exposing (group)


-- Imperative language style


rle : String -> String
rle rawString =
    case String.toList rawString of
        [] ->
            ""

        h :: t ->
            aux 1 h (String.fromList t)


aux : Int -> Char -> String -> String
aux runLength prevChar tailString =
    case String.toList tailString of
        [] ->
            String.concat <| String.fromChar prevChar :: [ toString runLength ]

        c :: s ->
            if c == prevChar then
                aux (runLength + 1) prevChar (String.fromList s)
            else
                String.concat <|
                    String.fromChar prevChar
                        :: [ toString runLength, aux 1 c (String.fromList s) ]



-- Functional language style


rle_ : String -> String
rle_ =
    String.concat << List.map (rls2str << toPair) << group << String.toList


rls2str : Maybe ( Char, Int ) -> String
rls2str rls =
    case rls of
        Just ( c, n ) ->
            String.concat <| String.fromChar c :: [ toString n ]

        Nothing ->
            ""


toPair : List Char -> Maybe ( Char, Int )
toPair str =
    case str of
        h :: _ ->
            Just ( h, List.length str )

        [] ->
            Nothing
