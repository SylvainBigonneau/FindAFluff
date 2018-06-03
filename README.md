# Find A Fluff

This is the code base used for [www.chien-ou-chat.fr](http://www.chien-ou-chat.fr)

## Prerequisites

- Elixir
- PostgreSQL
- NodeJS
- Webpack v3.12.0

## Install

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies in the "assets" folder with `npm install` and `webpack -p` (Use webpack v3, v4 might cause errors at this stage)
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Deployment

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

You can use the "chien_ou_chat.service" systemd file and the "launch.sh" script as examples to run the app on your server.

## Copyright and License

Copyright (c) 2018, Sylvain Bigonneau.

Find A Fluff source code is licensed under the [MIT License](LICENSE.md).
