-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.Commit exposing (BlameRequiredArguments, CommentsOptionalArguments, HistoryOptionalArguments, ParentsOptionalArguments, abbreviatedOid, additions, author, authoredByCommitter, authoredDate, blame, changedFiles, comments, commitResourcePath, commitUrl, committedDate, committedViaWeb, committer, deletions, history, id, message, messageBody, messageBodyHTML, messageHeadline, messageHeadlineHTML, oid, parents, pushedDate, repository, resourcePath, selection, signature, status, tarballUrl, tree, treeResourcePath, treeUrl, url, viewerCanSubscribe, viewerSubscription, zipballUrl)

import Github.Enum.SubscriptionState
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
selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.Commit
selection constructor =
    Object.selection constructor


{-| An abbreviated version of the Git object ID
-}
abbreviatedOid : Field String Github.Object.Commit
abbreviatedOid =
    Object.fieldDecoder "abbreviatedOid" [] Decode.string


{-| The number of additions in this commit.
-}
additions : Field Int Github.Object.Commit
additions =
    Object.fieldDecoder "additions" [] Decode.int


{-| Authorship details of the commit.
-}
author : SelectionSet decodesTo Github.Object.GitActor -> Field (Maybe decodesTo) Github.Object.Commit
author object_ =
    Object.selectionField "author" [] object_ (identity >> Decode.nullable)


{-| Check if the committer and the author match.
-}
authoredByCommitter : Field Bool Github.Object.Commit
authoredByCommitter =
    Object.fieldDecoder "authoredByCommitter" [] Decode.bool


{-| The datetime when this commit was authored.
-}
authoredDate : Field Github.Scalar.DateTime Github.Object.Commit
authoredDate =
    Object.fieldDecoder "authoredDate" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.DateTime)


type alias BlameRequiredArguments =
    { path : String }


{-| Fetches `git blame` information.

  - path - The file whose Git blame information you want.

-}
blame : BlameRequiredArguments -> SelectionSet decodesTo Github.Object.Blame -> Field decodesTo Github.Object.Commit
blame requiredArgs object_ =
    Object.selectionField "blame" [ Argument.required "path" requiredArgs.path Encode.string ] object_ identity


{-| The number of changed files in this commit.
-}
changedFiles : Field Int Github.Object.Commit
changedFiles =
    Object.fieldDecoder "changedFiles" [] Decode.int


type alias CommentsOptionalArguments =
    { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }


{-| Comments made on the commit.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
comments : (CommentsOptionalArguments -> CommentsOptionalArguments) -> SelectionSet decodesTo Github.Object.CommitCommentConnection -> Field decodesTo Github.Object.Commit
comments fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionField "comments" optionalArgs object_ identity


{-| The HTTP path for this Git object
-}
commitResourcePath : Field Github.Scalar.Uri Github.Object.Commit
commitResourcePath =
    Object.fieldDecoder "commitResourcePath" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.Uri)


{-| The HTTP URL for this Git object
-}
commitUrl : Field Github.Scalar.Uri Github.Object.Commit
commitUrl =
    Object.fieldDecoder "commitUrl" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.Uri)


{-| The datetime when this commit was committed.
-}
committedDate : Field Github.Scalar.DateTime Github.Object.Commit
committedDate =
    Object.fieldDecoder "committedDate" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.DateTime)


{-| Check if commited via GitHub web UI.
-}
committedViaWeb : Field Bool Github.Object.Commit
committedViaWeb =
    Object.fieldDecoder "committedViaWeb" [] Decode.bool


{-| Committership details of the commit.
-}
committer : SelectionSet decodesTo Github.Object.GitActor -> Field (Maybe decodesTo) Github.Object.Commit
committer object_ =
    Object.selectionField "committer" [] object_ (identity >> Decode.nullable)


{-| The number of deletions in this commit.
-}
deletions : Field Int Github.Object.Commit
deletions =
    Object.fieldDecoder "deletions" [] Decode.int


type alias HistoryOptionalArguments =
    { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, path : OptionalArgument String, author : OptionalArgument Github.InputObject.CommitAuthor, since : OptionalArgument Github.Scalar.GitTimestamp, until : OptionalArgument Github.Scalar.GitTimestamp }


{-| The linear commit history starting from (and including) this commit, in the same order as `git log`.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - path - If non-null, filters history to only show commits touching files under this path.
  - author - If non-null, filters history to only show commits with matching authorship.
  - since - Allows specifying a beginning time or date for fetching commits.
  - until - Allows specifying an ending time or date for fetching commits.

-}
history : (HistoryOptionalArguments -> HistoryOptionalArguments) -> SelectionSet decodesTo Github.Object.CommitHistoryConnection -> Field decodesTo Github.Object.Commit
history fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, path = Absent, author = Absent, since = Absent, until = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "path" filledInOptionals.path Encode.string, Argument.optional "author" filledInOptionals.author Github.InputObject.encodeCommitAuthor, Argument.optional "since" filledInOptionals.since (\(Github.Scalar.GitTimestamp raw) -> Encode.string raw), Argument.optional "until" filledInOptionals.until (\(Github.Scalar.GitTimestamp raw) -> Encode.string raw) ]
                |> List.filterMap identity
    in
    Object.selectionField "history" optionalArgs object_ identity


id : Field Github.Scalar.Id Github.Object.Commit
id =
    Object.fieldDecoder "id" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.Id)


{-| The Git commit message
-}
message : Field String Github.Object.Commit
message =
    Object.fieldDecoder "message" [] Decode.string


{-| The Git commit message body
-}
messageBody : Field String Github.Object.Commit
messageBody =
    Object.fieldDecoder "messageBody" [] Decode.string


{-| The commit message body rendered to HTML.
-}
messageBodyHTML : Field Github.Scalar.Html Github.Object.Commit
messageBodyHTML =
    Object.fieldDecoder "messageBodyHTML" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.Html)


{-| The Git commit message headline
-}
messageHeadline : Field String Github.Object.Commit
messageHeadline =
    Object.fieldDecoder "messageHeadline" [] Decode.string


{-| The commit message headline rendered to HTML.
-}
messageHeadlineHTML : Field Github.Scalar.Html Github.Object.Commit
messageHeadlineHTML =
    Object.fieldDecoder "messageHeadlineHTML" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.Html)


{-| The Git object ID
-}
oid : Field Github.Scalar.GitObjectID Github.Object.Commit
oid =
    Object.fieldDecoder "oid" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.GitObjectID)


type alias ParentsOptionalArguments =
    { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }


{-| The parents of a commit.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
parents : (ParentsOptionalArguments -> ParentsOptionalArguments) -> SelectionSet decodesTo Github.Object.CommitConnection -> Field decodesTo Github.Object.Commit
parents fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionField "parents" optionalArgs object_ identity


{-| The datetime when this commit was pushed.
-}
pushedDate : Field (Maybe Github.Scalar.DateTime) Github.Object.Commit
pushedDate =
    Object.fieldDecoder "pushedDate" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.DateTime |> Decode.nullable)


{-| The Repository this commit belongs to
-}
repository : SelectionSet decodesTo Github.Object.Repository -> Field decodesTo Github.Object.Commit
repository object_ =
    Object.selectionField "repository" [] object_ identity


{-| The HTTP path for this commit
-}
resourcePath : Field Github.Scalar.Uri Github.Object.Commit
resourcePath =
    Object.fieldDecoder "resourcePath" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.Uri)


{-| Commit signing information, if present.
-}
signature : SelectionSet decodesTo Github.Interface.GitSignature -> Field (Maybe decodesTo) Github.Object.Commit
signature object_ =
    Object.selectionField "signature" [] object_ (identity >> Decode.nullable)


{-| Status information for this commit
-}
status : SelectionSet decodesTo Github.Object.Status -> Field (Maybe decodesTo) Github.Object.Commit
status object_ =
    Object.selectionField "status" [] object_ (identity >> Decode.nullable)


{-| Returns a URL to download a tarball archive for a repository. Note: For private repositories, these links are temporary and expire after five minutes.
-}
tarballUrl : Field Github.Scalar.Uri Github.Object.Commit
tarballUrl =
    Object.fieldDecoder "tarballUrl" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.Uri)


{-| Commit's root Tree
-}
tree : SelectionSet decodesTo Github.Object.Tree -> Field decodesTo Github.Object.Commit
tree object_ =
    Object.selectionField "tree" [] object_ identity


{-| The HTTP path for the tree of this commit
-}
treeResourcePath : Field Github.Scalar.Uri Github.Object.Commit
treeResourcePath =
    Object.fieldDecoder "treeResourcePath" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.Uri)


{-| The HTTP URL for the tree of this commit
-}
treeUrl : Field Github.Scalar.Uri Github.Object.Commit
treeUrl =
    Object.fieldDecoder "treeUrl" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.Uri)


{-| The HTTP URL for this commit
-}
url : Field Github.Scalar.Uri Github.Object.Commit
url =
    Object.fieldDecoder "url" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.Uri)


{-| Check if the viewer is able to change their subscription status for the repository.
-}
viewerCanSubscribe : Field Bool Github.Object.Commit
viewerCanSubscribe =
    Object.fieldDecoder "viewerCanSubscribe" [] Decode.bool


{-| Identifies if the viewer is watching, not watching, or ignoring the subscribable entity.
-}
viewerSubscription : Field Github.Enum.SubscriptionState.SubscriptionState Github.Object.Commit
viewerSubscription =
    Object.fieldDecoder "viewerSubscription" [] Github.Enum.SubscriptionState.decoder


{-| Returns a URL to download a zipball archive for a repository. Note: For private repositories, these links are temporary and expire after five minutes.
-}
zipballUrl : Field Github.Scalar.Uri Github.Object.Commit
zipballUrl =
    Object.fieldDecoder "zipballUrl" [] (Decode.oneOf [ Decode.string, Decode.float |> Decode.map Debug.toString, Decode.int |> Decode.map Debug.toString, Decode.bool |> Decode.map Debug.toString ] |> Decode.map Github.Scalar.Uri)
