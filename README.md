# elm-port-schema-starter

This is an example repo to get you up and running wtih `elm-port-schema`.

The entrypoint is `src/index.ts`. That file imports `src/Main.elm`.
`src/Main.d.ts` provides typings for the ports.<br/>
`src/Main.elm` imports `src/Port.elm` in order to send and recive messages through ports.



## Setup instructions

Make sure `elm` is installed.

Clone this repo:
```
git@github.com:hugobastas/elm-port-schema-starter.git
```

Install all the npm packages:
```
cd elm-port-schema-starter
npm install
```

`npm start` runns a local development server at
[localhost:8080](http://localhost:8080)


`npm run update-schema` regenerates `src/Port.elm` and `src/Main.d.ts` from
the types in `src/Port.elm`.

`npm run build` creates a `bundle.js` and `index.html` in the `dist` folder.
