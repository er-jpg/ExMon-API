defmodule ExMonWeb.TrainerView do
  use ExMonWeb, :view
  alias ExMon.Trainer

  def render("created.json", %{trainer: %Trainer{id: id, name: name}}) do
    %{
      message: "Trainer Created!",
      trainer: %{
        id: id,
        name: name
      }
    }
  end

  def render("show.json", %{trainer: %Trainer{id: id, name: name}}) do
    %{
      id: id,
      name: name
    }
  end

  def render("update.json", %{trainer: %Trainer{id: id, name: name}}) do
    %{
      message: "Trainer Updated!",
      trainer: %{
        id: id,
        name: name
      }
    }
  end
end
