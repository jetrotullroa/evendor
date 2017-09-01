defmodule EvendorWeb.UserRegistrationTest do

  use Evendor.DataCase
  use Hound.Helpers

  hound_session()

  ## Fill out the form and Register the User

  test "register an account with valid data" do
    navigate_to("/register")

    form = find_element(:id, "registration-form")

    find_within_element(form, :name, "registration[:name]")
    |> fill_field("John Doe")

    find_within_element(form, :name, "registration[:email]")
    |> fill_field("johndoe@example.com")

    find_within_element(form, :name, "registration[:residence_area]")
    |> fill_field("Area 1")

    find_within_element(form, :name, "registration[:phone]")
    |> fill_field("1111")

    find_within_element(form, :tag, "button")
    |> click

    assert current_path() == "/"
    message = find_element(:class, "alert") |> visible_text()

    assert message == "Registration Successful"
  end

  test "shows error on invalid data" do
    navigate_to("/register")

    form = find_element(:id, "registration-form")

    find_within_element(form, :tag, "button") |> click

    assert current_path() == "/register"
    message = find_element(:class, "alert") |> visible_text()

    assert message == "Oops, something went wrong! Please check the errors below"

  end

end
