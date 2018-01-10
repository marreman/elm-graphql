-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 1.0.1
-- Target elm package version 4.1.0
-- https://github.com/dillonkearns/graphqelm


module Github.Object.TextMatchHighlight exposing (..)

import Github.Interface
import Github.Object
import Github.Scalar
import Github.Union
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.TextMatchHighlight
selection constructor =
    Object.selection constructor


{-| The indice in the fragment where the matched text begins.
-}
beginIndice : FieldDecoder Int Github.Object.TextMatchHighlight
beginIndice =
    Object.fieldDecoder "beginIndice" [] Decode.int


{-| The indice in the fragment where the matched text ends.
-}
endIndice : FieldDecoder Int Github.Object.TextMatchHighlight
endIndice =
    Object.fieldDecoder "endIndice" [] Decode.int


{-| The text matched.
-}
text : FieldDecoder String Github.Object.TextMatchHighlight
text =
    Object.fieldDecoder "text" [] Decode.string
