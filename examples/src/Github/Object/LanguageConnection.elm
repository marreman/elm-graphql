module Github.Object.LanguageConnection exposing (..)

import Github.Interface
import Github.Object
import Github.Union
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.LanguageConnection
selection constructor =
    Object.object constructor


{-| A list of edges.
-}
edges : SelectionSet selection Github.Object.LanguageEdge -> FieldDecoder (Maybe (List (Maybe selection))) Github.Object.LanguageConnection
edges object =
    Object.selectionFieldDecoder "edges" [] object (identity >> Decode.maybe >> Decode.list >> Decode.maybe)


{-| A list of nodes.
-}
nodes : SelectionSet selection Github.Object.Language -> FieldDecoder (Maybe (List (Maybe selection))) Github.Object.LanguageConnection
nodes object =
    Object.selectionFieldDecoder "nodes" [] object (identity >> Decode.maybe >> Decode.list >> Decode.maybe)


{-| Information to aid in pagination.
-}
pageInfo : SelectionSet selection Github.Object.PageInfo -> FieldDecoder selection Github.Object.LanguageConnection
pageInfo object =
    Object.selectionFieldDecoder "pageInfo" [] object identity


{-| Identifies the total count of items in the connection.
-}
totalCount : FieldDecoder Int Github.Object.LanguageConnection
totalCount =
    Object.fieldDecoder "totalCount" [] Decode.int


{-| The total size in bytes of files written in that language.
-}
totalSize : FieldDecoder Int Github.Object.LanguageConnection
totalSize =
    Object.fieldDecoder "totalSize" [] Decode.int
