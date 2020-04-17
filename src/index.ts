import { Elm, FromElmMessage } from "./Main"

let app = Elm.Main.init()

app.ports.fromElm.subscribe(function(msg: FromElmMessage) {
  if (msg.variant === "JsIncrement") {
    let value = msg._0
    let newValue = value + 1
    app.ports.toElm.send(newValue)
  } else if (msg.variant === "JsDecrement") {
    let value = msg._0
    let newValue = value - 1
    app.ports.toElm.send(newValue)
  }
})
