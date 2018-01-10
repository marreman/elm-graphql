-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 1.0.1
-- Target elm package version 4.1.0
-- https://github.com/dillonkearns/graphqelm


module Github.Object.Topic exposing (..)

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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.Topic
selection constructor =
    Object.selection constructor


id : FieldDecoder Github.Scalar.Id Github.Object.Topic
id =
    Object.fieldDecoder "id" [] (Decode.string |> Decode.map Github.Scalar.Id)


{-| The topic's name.
-}
name : FieldDecoder String Github.Object.Topic
name =
    Object.fieldDecoder "name" [] Decode.string


{-| A list of related topics, including aliases of this topic, sorted with the most relevant
first.
-}
relatedTopics : SelectionSet selection Github.Object.Topic -> FieldDecoder (List selection) Github.Object.Topic
relatedTopics object =
    Object.selectionFieldDecoder "relatedTopics" [] object (identity >> Decode.list)
