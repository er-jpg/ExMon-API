defmodule ExMonWeb.TrainerPokemonView do
  use ExMonWeb, :view
  alias ExMon.Trainer.Pokemon

  def render("create.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          trainer_id: trainer_id,
          weight: weight
        }
      }) do
    %{
      message: "Pokemon Associated!",
      pokemon: %{
        id: id,
        name: name,
        nickname: nickname,
        weight: weight,
        trainer_id: trainer_id,
        types: types
      }
    }
  end

  def render("show.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          trainer: %{id: trainer_id, name: trainer_name},
          weight: weight
        }
      }) do
    %{
      pokemon: %{
        id: id,
        name: name,
        nickname: nickname,
        weight: weight,
        trainer: %{
          id: trainer_id,
          name: trainer_name
        },
        types: types
      }
    }
  end

  def render("update.json", %{
        pokemon: %Pokemon{
          id: id,
          name: name,
          nickname: nickname,
          types: types,
          trainer_id: trainer_id,
          weight: weight
        }
      }) do
    %{
      message: "Pokemon Updated!",
      pokemon: %{
        id: id,
        name: name,
        nickname: nickname,
        weight: weight,
        trainer_id: trainer_id,
        types: types
      }
    }
  end
end
