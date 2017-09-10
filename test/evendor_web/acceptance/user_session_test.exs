defmodule EvendorWeb.UserSessionTest do

  use Evendor.DataCase
  use Hound.Helpers

  hound_session()

  setup do
    alias Evendor.CRM
    valid_attrs = %{
      "name" => "John Doe",
      "email" => "johndoe@example.com",
      "password" => "super secret",
      "residence_area" => "Area 1",
      "phone" => "1111"
    }

    {:ok, _customer } = CRM.create_customer(valid_attrs)
    :ok
  end

  test "login an account with valid data" do
    navigate_to("/login")

    form = find_element(:id, "session-form")

    find_within_element(form, :name, "session[email]")
    |> fill_field("johndoe@example.com")

    find_within_element(form, :name, "session[password]")
    |> fill_field("super secret")

    find_within_element(form, :tag, "button")
    |> click

    assert current_path() == "/"

    message = find_element(:class, "alert")
    |> visible_text()

    assert message == "You have successfully logged in."
  end

  test "login an account with invalid data" do
    navigate_to("/login")

    form = find_element(:id, "session-form")

    find_within_element(form, :tag, "button")
    |> click

    assert current_path() =="/login"

    message = find_element(:class, "alert")
    |> visible_text()

    assert message == "Invalid user credentials."

  end
end
