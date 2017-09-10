defmodule Evendor.CRMTest do
  use Evendor.DataCase

  alias Evendor.CRM
  alias Evendor.CRM.Customer

  test "build_customer/0 returns customer changeset" do
    assert %Ecto.Changeset{ data: %Customer{} } = CRM.build_customer
  end

  test "build_customer/1 returns a customer changeset with values applied" do
    attrs = %{ "name" => "John" }
    changeset = CRM.build_customer(attrs)
    assert changeset.params == attrs
  end

  test "create_customer/1 returns a customer for a valid data" do
    valid_attrs = %{
      "name" => "John",
      "email" => "johndoe@example.com",
      "password" => "super sercret",
      "residence_area" => "Area 1",
      "phone" => "1111",
    }

    assert {:ok, customer} = CRM.create_customer(valid_attrs)
    assert Comeonin.Bcrypt.checkpw(valid_attrs["password"], customer.password_hash)
  end

  test "create_customer/1 returns a customer for a invalid data" do
    invalid_attrs = %{}
    assert {:error, %Ecto.Changeset{}} = CRM.create_customer(invalid_attrs)
  end

  test "get_customer_by_email/1" do
    valid_attrs = %{
      "name" => "John Doe",
      "email" => "johndoe@example.com",
      "password" => "super secret",
      "residence_area" => "Area 1",
      "phone" => "1111"
    }

    {:ok, customer1} = CRM.create_customer(valid_attrs)
    customer2 = CRM.get_customer_by_email(customer1.email)
    assert customer1.id == customer2.id
  end

  test "get_customer_by_credentials/1" do
    valid_attrs = %{
      "name" => "John Doe",
      "email" => "johndoe@example.com",
      "password" => "super secret",
      "residence_area" => "Area 1",
      "phone" => "1111"
    }

    {:ok, customer1} = CRM.create_customer(valid_attrs)
    customer2 = CRM.get_customer_by_credentials(%{"email" => customer1.email, "password" => customer1.password})
    assert customer1.id == customer2.id
  end

end
