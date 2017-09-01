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

end
