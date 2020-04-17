/*
 * Module
*/

export let Elm: {
    Main: {
        init: (flags?: any) => ElmApp
    }
}

export interface ElmApp extends Object {
    ports: {
        toElm: {
            send: (msg: ToElmMessage) => void
        },
        fromElm: {
            subscribe: (f: (msg: FromElmMessage) => void) => void
        }
    }
}

/*
 * Declarations
*/

export type FromElmMessage
    = { variant : "JsIncrement"
    , _0 : number
    }
    | { variant : "JsDecrement"
    , _0 : number
    }

export type ToElmMessage =
    number

/*
 * Prelude
*/

export type Unit =
    { variant : "()"
    }

export type Maybe<T>
    = { variant : "Just"
      , _0 : T
      }
    | { variant : "Nothing"
      }

export type Result<E, T>
    = { variant : "Ok"
      , _0 : T
      }
    | { variant : "Err"
      , _0 : E
      }
