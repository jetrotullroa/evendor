defmodule EvendorWeb.RegistrationController do
  use EvendorWeb, :controller
  alias Evendor.CRM

  def new(conn, _) do
    changeset = CRM.build_customer()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{ "registration" => registration_params}) do
    case CRM.create_customer(registration_params) do
      {:ok, customer} ->
        conn
        |> put_flash(:info, "Registration Successful!")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render(:new, changeset: changeset)
    end
  end

end
