defmodule EvendorWeb.CategoryView do
  use EvendorWeb, :view

  def title_case(name) do
    name
    |> String.downcase
    |> String.capitalize
  end
  
end
