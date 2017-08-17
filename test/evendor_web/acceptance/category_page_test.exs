defmodule EvendorWeb.CategoryPageTest do

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

  test "show vegetables" do
    navigate_to("/categories/vegetables")

    ## THEN ##
    # I expect the page title to be 'Vegetables'

    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Vegetables"

    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    # And I expect Tomato in the product displayed
    assert product_name == "Tomato"
    assert product_price == "20"

    # And I expect Apple in the product is not displayed
    refute product_name == "Apple"
  end

  test "show fruits" do
    navigate_to("/categories/fruits")

    ## THEN ##
    # I exepect the page title to be 'Fruits'

    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Fruits"

    # And I expect Apple in the product displayed
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Apple"
    assert product_price == "100"

    # And I expect Tomato in the product is not displayed
    refute product_name == "Tomato"

  end

end
