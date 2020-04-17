module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Json.Decode
import Port


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type alias Model =
    { value : Int
    , error : Maybe Json.Decode.Error
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { value = 0
      , error = Nothing
      }
    , Cmd.none
    )


type Msg
    = Increment
    | Decrement
    | PortMessage (Result Json.Decode.Error Port.ToElmMessage)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model, Port.send (Port.JsIncrement model.value) )

        Decrement ->
            ( model, Port.send (Port.JsDecrement model.value) )

        PortMessage (Ok newValue) ->
            ( { model | value = newValue }, Cmd.none )

        PortMessage (Err error) ->
            ( { model | error = Just error }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Port.recive PortMessage


view : Model -> Browser.Document Msg
view model =
    case model.error of
        Nothing ->
            { title = "elm-port-schema starter"
            , body =
                [ button [ onClick Increment ] [ text "Increment" ]
                , div [] [ text (String.fromInt model.value) ]
                , button [ onClick Decrement ] [ text "Decrement" ]
                ]
            }

        Just error ->
            { title = "ERROR! :(("
            , body =
                [ text "This should not happen.. But here we are \\p.p/"
                , text ("Error: " ++ Json.Decode.errorToString error)
                ]
            }
