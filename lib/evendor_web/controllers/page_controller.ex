defmodule EvendorWeb.PageController do
  use EvendorWeb, :controller
  alias Evendor.Catalog

  def index(conn, _params) do
    seasonal_products = Catalog.list_seasonal_products
    render conn, "index.html", seasonal_products: seasonal_products
  end
end
