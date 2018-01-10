-- Do not manually edit this file, it was auto-generated by Graphqelm
-- npm package version 1.0.1
-- Target elm package version 4.1.0
-- https://github.com/dillonkearns/graphqelm


module Swapi.InputObject.Greeting exposing (..)

import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.Internal.Encode as Encode exposing (Value)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode
import Swapi.Enum.Language
import Swapi.InputObject
import Swapi.InputObject.GreetingOptions
import Swapi.Interface
import Swapi.Object
import Swapi.Scalar
import Swapi.Union


{-| Encode a Greeting into a value that can be used as an argument.
-}
encode : Greeting -> Value
encode input =
    Encode.maybeObject
        [ ( "language", Encode.enum Swapi.Enum.Language.toString |> Encode.optional input.language ), ( "name", Encode.string input.name |> Just ), ( "options", Swapi.InputObject.GreetingOptions.encode |> Encode.optional input.options ) ]


{-| Type for the Greeting input object.
-}
type alias Greeting =
    { language : OptionalArgument Swapi.Enum.Language.Language, name : String, options : OptionalArgument Swapi.InputObject.GreetingOptions.GreetingOptions }
