defmodule EvendorWeb.HomepageTest do

  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  test "presence of seasonal product" do
    ## GIVEN ##
    # There are two products Apple and Tomato price 100 and 50 respectively
    # Where Apple being the only seasonal product”

    ## WHEN ##
    # I navigate to home page
    navigate_to("/")

    ## THEN ##
    # I expect the header title to be "Seasonal Products"
    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title =~ "Seasonal Products"

    # And I expect apple on the product displayed
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name")
    product_price = find_within_element(product, :css, ".product-price")

    assert product_name = "Apple"
    assert product_price = 100

    # And I expect tomato not present on the product diplayed
    refute page_source() =~ "Tomato"

  end

end
