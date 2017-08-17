defmodule EvendorWeb.HomepageTest do

  use Evendor.DataCase
  use Hound.Helpers

  alias Evendor.Repo
  alias Evendor.Catalog.Product

  hound_session()

  setup do
    ## GIVEN ##
    # There are two products 'Apple' and 'Tomato' priced 100 and 20
    # categorized under  'fruits' and 'vegetables' respectively

    Repo.insert %Product{ name: "Tomato", price: 20, sku: "A123", is_seasonal: false, category: "vegetables"}
    Repo.insert %Product{ name: "Apple", price: 100, sku: "Z321", is_seasonal: true, category: "fruits"}
    :ok
  end

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
    assert page_title == "Seasonal Products"

    # And I expect apple on the product displayed
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Apple"
    assert product_price == "100"

    # And I expect tomato not present on the product diplayed
    refute page_source() =~ "Tomato"

  end

end
