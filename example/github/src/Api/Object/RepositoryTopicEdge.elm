module Api.Object.RepositoryTopicEdge exposing (..)

import Api.Object
import Graphqelm.Argument as Argument exposing (Argument)
import Graphqelm.Field as Field exposing (Field, FieldDecoder)
import Graphqelm.Object as Object exposing (Object)
import Graphqelm.Value as Value exposing (Value)
import Json.Decode as Decode
import Json.Encode as Encode


build : (a -> constructor) -> Object (a -> constructor) Api.Object.RepositoryTopicEdge
build constructor =
    Object.object constructor


cursor : FieldDecoder String Api.Object.RepositoryTopicEdge
cursor =
    Object.fieldDecoder "cursor" [] Decode.string


node : Object node Api.Object.RepositoryTopic -> FieldDecoder node Api.Object.RepositoryTopicEdge
node object =
    Object.single "node" [] object
