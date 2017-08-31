defmodule EvendorWeb.UserRegistrationTest do

  use Evendor.DataCase
  use Hound.Helpers

  hound_session()

  ## Fill out the form and Register the User

  test "register an account with valid data" do
    navigate_to("/register")

    form = find_element(:id, "registration-form")

    find_within_element(form, :name, "registration[:name]")
  end

end
