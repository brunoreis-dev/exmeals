defmodule Exmeal.Meals.Update do
  alias Ecto.Changeset
  alias Exmeal.{Error, Repo}
  alias Exmeal.Meal

  def call(%{"id" => id} = params) do
    with %Meal{} = meal <- Repo.get(Meal, id),
         %Changeset{} = meal <- Meal.changeset(meal, params) do
      Repo.update(meal)
    else
      nil -> {:error, Error.build_meal_not_found_error()}
    end
  end
end
