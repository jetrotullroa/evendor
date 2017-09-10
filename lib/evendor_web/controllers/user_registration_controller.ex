defmodule EvendorWeb.UserRegistrationController do
  use EvendorWeb, :controller
  alias Evendor.CRM

  def new(conn, _) do
    changeset = CRM.build_customer()
    residence_areas = Auroville.ResidenceService.list_areas
    render(conn, "new.html", changeset: changeset, residence_areas: residence_areas)
  end

  def create(conn, %{ "registration" => registration_params}) do
    case CRM.create_customer(registration_params) do
      {:ok, _customer} ->
        conn
        |> put_flash(:info, "Registration Successful!")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        residence_areas = Auroville.ResidenceService.list_areas
        conn
        |> render(:new, changeset: changeset, residence_areas: residence_areas)
    end
  end

end
