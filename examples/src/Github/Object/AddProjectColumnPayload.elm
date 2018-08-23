-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.AddProjectColumnPayload exposing (clientMutationId, columnEdge, project, selection)

import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.Union
import Graphql.Field as Field exposing (Field)
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| Select fields to build up a SelectionSet for this object.
-}
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.AddProjectColumnPayload
selection constructor =
    Object.selection constructor


{-| A unique identifier for the client performing the mutation.
-}
clientMutationId : Field (Maybe String) Github.Object.AddProjectColumnPayload
clientMutationId =
    Object.fieldDecoder "clientMutationId" [] (Decode.string |> Decode.nullable)


{-| The edge from the project's column connection.
-}
columnEdge : SelectionSet decodesTo Github.Object.ProjectColumnEdge -> Field decodesTo Github.Object.AddProjectColumnPayload
columnEdge object_ =
    Object.selectionField "columnEdge" [] object_ identity


{-| The project
-}
project : SelectionSet decodesTo Github.Object.Project -> Field decodesTo Github.Object.AddProjectColumnPayload
project object_ =
    Object.selectionField "project" [] object_ identity
