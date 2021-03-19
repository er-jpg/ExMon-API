defmodule ExMonWeb.FallbackController do
  use ExMonWeb, :controller

  def call(conn, {{:error, :not_found}, element}) do
    conn
    |> put_status(404)
    |> put_view(ExMonWeb.ErrorView)
    |> render("404.json", element: element)
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(400)
    |> put_view(ExMonWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
