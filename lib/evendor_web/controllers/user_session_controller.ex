defmodule EvendorWeb.UserSessionController do
  use EvendorWeb, :controller

  alias Evendor.CRM

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => session_params}) do
    case CRM.get_customer_by_credentials(session_params) do
      :error ->
        conn
          |> put_flash(:error, "Invalid user credentials.")
          |> render("new.html")
      customer ->
        conn
        |> assign(:current_customer, customer)
        |> put_session(:customer_id, customer.id)
        |> put_flash(:info, "You have successfully logged in.")
        |> redirect(to: page_path(conn, :index))
    end
  end

end
