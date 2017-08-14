defmodule EvendorWeb.PageController do
  use EvendorWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
