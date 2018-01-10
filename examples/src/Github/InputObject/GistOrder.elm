-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 1.0.1
-- Target elm package version 4.1.0
-- https://github.com/dillonkearns/graphqelm


module Github.InputObject.GistOrder exposing (..)

import Github.Enum.GistOrderField
import Github.Enum.OrderDirection
import Github.InputObject
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


{-| Encode a GistOrder into a value that can be used as an argument.
-}
encode : GistOrder -> Value
encode input =
    Encode.maybeObject
        [ ( "field", Encode.enum Github.Enum.GistOrderField.toString input.field |> Just ), ( "direction", Encode.enum Github.Enum.OrderDirection.toString input.direction |> Just ) ]


{-| Type for the GistOrder input object.
-}
type alias GistOrder =
    { field : Github.Enum.GistOrderField.GistOrderField, direction : Github.Enum.OrderDirection.OrderDirection }
