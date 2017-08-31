defmodule Evendor.CRM do

  alias Evendor.Repo
  alias Evendor.CRM.Customer

  def build_customer(attrs \\ %{}) do
    %Customer{}
    |> Customer.changeset(attrs)
  end

end
