defmodule ExMonWeb.TrainerPokemonController do
  use ExMonWeb, :controller

  action_fallback ExMonWeb.FallbackController

  def create(conn, params) do
    params
    |> ExMon.create_trainer_pokemon()
    |> handle_response(conn, "created.json", :created)
  end

  def delete(conn, %{"id" => uuid}) do
    uuid
    |> ExMon.delete_trainer_pokemon()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => uuid}) do
    uuid
    |> ExMon.fetch_trainer_pokemon()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> ExMon.update_trainer_pokemon()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_response({:ok, pokemon}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, pokemon: pokemon)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error

  defp handle_delete({:ok, _pokemon}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error
end
