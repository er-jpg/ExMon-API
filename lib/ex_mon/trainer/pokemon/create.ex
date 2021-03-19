defmodule ExMon.Trainer.Pokemon.Create do
  alias ExMon.{Pokemon, Repo}
  alias ExMon.Trainer.Pokemon, as: TrainerPokemon

  def call(%{"name" => name} = params) do
    name
    |> ExMon.fetch_pokemon()
    |> handle_response(params)
  end

  defp handle_response({:ok, %Pokemon{} = pokemon}, params), do: create_pokemon(pokemon, params)
  defp handle_response({:error, _reason} = error, _params), do: error

  defp create_pokemon(%Pokemon{name: name, weight: weight, types: types}, %{
         "nickname" => nickname,
         "trainer_id" => trainer_id
       }) do
    params = %{
      name: name,
      weight: weight,
      types: types,
      nickname: nickname,
      trainer_id: trainer_id
    }

    params
    |> TrainerPokemon.build()
    |> handle_build()
  end

  defp handle_build({:ok, pokemon}), do: Repo.insert(pokemon)
  defp handle_build({:error, _changeset} = error), do: error
end
