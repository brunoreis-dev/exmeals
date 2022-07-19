defmodule Exmeal.Error do
  @keys [:result, :status]

  @enforce_keys @keys

  defstruct @enforce_keys

  def build(status, result) do
    %__MODULE__{
      result: result,
      status: status
    }
  end

  def build_meal_not_found_error, do: build(:not_found, "Meal not found")
end
