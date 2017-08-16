use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :evendor, EvendorWeb.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Use PhnatomJS Browser for testing
config :hound, driver: "phantomjs"

# Configure your database
config :evendor, Evendor.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "jetrotullroa",
  password: "",
  database: "evendor_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
