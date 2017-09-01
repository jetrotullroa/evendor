defmodule Evendor.CRM.Customer do
  use Ecto.Schema
  import Ecto.Changeset
  alias Evendor.CRM.Customer
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "customers" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :phone, :string
    field :residence_area, :string

    timestamps()
  end

  @doc false
  def changeset(%Customer{} = customer, attrs) do
    customer
    |> cast(attrs, [:name, :email, :phone, :residence_area, :password])
    |> validate_required([:name, :email, :phone, :residence_area, :password])
    |> validate_format(:email, ~r/@/, message: "not a valid email")
    |> validate_length(:password, min: 6, max: 100)
    |> unique_constraint(:email)
    |> put_hashed_password()
  end

  defp put_hashed_password(changeset) do
    case changeset.valid? do
      true ->
        changes = changeset.changes
        put_change(changeset, :password_hash, hashpwsalt(changes.password))
      _ ->
        changeset
    end
  end

end
