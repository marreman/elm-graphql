module Github.Interface.RepositoryOwner exposing (..)

import Github.Enum.RepositoryAffiliation
import Github.Enum.RepositoryPrivacy
import Github.Interface
import Github.Object
import Github.Union
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (FragmentSelectionSet(FragmentSelectionSet), SelectionSet(SelectionSet))
import Json.Decode as Decode


baseSelection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Interface.RepositoryOwner
baseSelection constructor =
    Object.object constructor


selection : (Maybe typeSpecific -> a -> constructor) -> List (FragmentSelectionSet typeSpecific Github.Interface.RepositoryOwner) -> SelectionSet (a -> constructor) Github.Interface.RepositoryOwner
selection constructor typeSpecificDecoders =
    Object.polymorphicObject typeSpecificDecoders constructor


onOrganization : SelectionSet selection Github.Object.Organization -> FragmentSelectionSet selection Github.Interface.RepositoryOwner
onOrganization (SelectionSet fields decoder) =
    FragmentSelectionSet "Organization" fields decoder


onUser : SelectionSet selection Github.Object.User -> FragmentSelectionSet selection Github.Interface.RepositoryOwner
onUser (SelectionSet fields decoder) =
    FragmentSelectionSet "User" fields decoder


{-| A URL pointing to the owner's public avatar.

  - size - The size of the resulting square image.

-}
avatarUrl : ({ size : OptionalArgument Int } -> { size : OptionalArgument Int }) -> FieldDecoder String Github.Interface.RepositoryOwner
avatarUrl fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { size = Absent }

        optionalArgs =
            [ Argument.optional "size" filledInOptionals.size Encode.int ]
                |> List.filterMap identity
    in
    Object.fieldDecoder "avatarUrl" optionalArgs Decode.string


id : FieldDecoder String Github.Interface.RepositoryOwner
id =
    Object.fieldDecoder "id" [] Decode.string


{-| The username used to login.
-}
login : FieldDecoder String Github.Interface.RepositoryOwner
login =
    Object.fieldDecoder "login" [] Decode.string


{-| A list of repositories this user has pinned to their profile

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - privacy - If non-null, filters repositories according to privacy
  - orderBy - Ordering options for repositories returned from the connection
  - affiliations - Affiliation options for repositories returned from the connection
  - isLocked - If non-null, filters repositories according to whether they have been locked

-}
pinnedRepositories : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy, orderBy : OptionalArgument Value, affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation)), isLocked : OptionalArgument Bool } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy, orderBy : OptionalArgument Value, affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation)), isLocked : OptionalArgument Bool }) -> SelectionSet selection Github.Object.RepositoryConnection -> FieldDecoder selection Github.Interface.RepositoryOwner
pinnedRepositories fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, privacy = Absent, orderBy = Absent, affiliations = Absent, isLocked = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "privacy" filledInOptionals.privacy (Encode.enum Github.Enum.RepositoryPrivacy.toString), Argument.optional "orderBy" filledInOptionals.orderBy identity, Argument.optional "affiliations" filledInOptionals.affiliations (Encode.enum Github.Enum.RepositoryAffiliation.toString |> Encode.maybe |> Encode.list), Argument.optional "isLocked" filledInOptionals.isLocked Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "pinnedRepositories" optionalArgs object identity


{-| A list of repositories that the user owns.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - privacy - If non-null, filters repositories according to privacy
  - orderBy - Ordering options for repositories returned from the connection
  - affiliations - Affiliation options for repositories returned from the connection
  - isLocked - If non-null, filters repositories according to whether they have been locked
  - isFork - If non-null, filters repositories according to whether they are forks of another repository

-}
repositories : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy, orderBy : OptionalArgument Value, affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation)), isLocked : OptionalArgument Bool, isFork : OptionalArgument Bool } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy, orderBy : OptionalArgument Value, affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation)), isLocked : OptionalArgument Bool, isFork : OptionalArgument Bool }) -> SelectionSet selection Github.Object.RepositoryConnection -> FieldDecoder selection Github.Interface.RepositoryOwner
repositories fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, privacy = Absent, orderBy = Absent, affiliations = Absent, isLocked = Absent, isFork = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "privacy" filledInOptionals.privacy (Encode.enum Github.Enum.RepositoryPrivacy.toString), Argument.optional "orderBy" filledInOptionals.orderBy identity, Argument.optional "affiliations" filledInOptionals.affiliations (Encode.enum Github.Enum.RepositoryAffiliation.toString |> Encode.maybe |> Encode.list), Argument.optional "isLocked" filledInOptionals.isLocked Encode.bool, Argument.optional "isFork" filledInOptionals.isFork Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "repositories" optionalArgs object identity


{-| Find Repository.

  - name - Name of Repository to find.

-}
repository : { name : String } -> SelectionSet selection Github.Object.Repository -> FieldDecoder (Maybe selection) Github.Interface.RepositoryOwner
repository requiredArgs object =
    Object.selectionFieldDecoder "repository" [ Argument.required "name" requiredArgs.name Encode.string ] object (identity >> Decode.maybe)


{-| The HTTP URL for the owner.
-}
resourcePath : FieldDecoder String Github.Interface.RepositoryOwner
resourcePath =
    Object.fieldDecoder "resourcePath" [] Decode.string


{-| The HTTP URL for the owner.
-}
url : FieldDecoder String Github.Interface.RepositoryOwner
url =
    Object.fieldDecoder "url" [] Decode.string
