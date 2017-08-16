defmodule Evendor.CatalogTest do

  use ExUnit.Case
  alias Evendor.Catalog
  alias Evendor.Catalog.Product

  test "list_products/0 returns all products" do
    [p1 = %Product{}, p2 = %Product{}] = Catalog.list_products

    assert p1.name == "Tomato"
    assert p2.name == "Apple"
  end

  test "list_seasonal_products/0 returns all product that is seasonal" do
    [p1 = %Product{}] = Catalog.list_seasonal_products

    assert p1.name == "Apple"
  end

  test "get_category_products/1 returns the products of the given category" do
    [product = %Product{}] = Catalog.get_category_products("fruits")

    assert product.name == "Apple"
  end

end
