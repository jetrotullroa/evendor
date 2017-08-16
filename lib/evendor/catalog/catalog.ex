defmodule Evendor.Catalog do

  alias Evendor.Catalog.Product

  def list_products do
    p1 = %Product{name: "Tomato", price: 20, is_seasonal: false, category: "vegetables"}
    p2 = %Product{name: "Apple", price: 100, is_seasonal: true, category: "fruits"}
    [p1, p2]
  end

  def list_seasonal_products do
    list_products()
    |> Enum.filter(fn(product) -> product.is_seasonal == true end)
  end
end
