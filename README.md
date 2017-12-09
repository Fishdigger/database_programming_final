# Joel's Database Programming Final Project

### Dependencies

Be sure to install each of these before trying to run the project
- (Elixir)[https://elixir-lang.org/install.html]
- (NodeJS)[https://nodejs.org/en/download/]
- (Phoenix)[https://hexdocs.pm/phoenix/installation.html#content]
- (MySQL)[https://www.mysql.com/downloads/]

### Setup

1. Clone this repo
2. `cd` into `/sql_scripts` and run each one against your MySQL install
2. Edit `/knight_hardare/config/dev.exs` for your database's address
2. `cd` into `/knight_hardware` and run `mix deps.get`
3. Run `mix phx.server`
4. `cd` into `/knight_hardware_client` and run `npm install`
5. Run `npm start`