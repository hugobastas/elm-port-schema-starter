module Schema exposing (..)


type FromElmMessage
    = JsIncrement Int
    | JsDecrement Int


type alias ToElmMessage =
    Int
