defmodule Evendor.CRM do

  alias Evendor.Repo
  alias Evendor.CRM.Customer

  def build_customer(attrs \\ %{}) do
    %Customer{}
    |> Customer.changeset(attrs)
  end

  def create_customer(attrs) do
    attrs
    |> build_customer
    |> Repo.insert
  end

  def get_customer_by_email(email) do
    Repo.get_by(Customer, email: email)
  end

  def get_customer_by_credentials(%{"email" => email, "password" => password}) do
    customer = get_customer_by_email(email)

    cond do
      customer && Comeonin.Bcrypt.checkpw(password, customer.password_hash) ->
        customer
      true ->
        :error
    end
  end

end
