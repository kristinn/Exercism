defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun), do: f(list, &fun.(&1), [])

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun), do: f(list, &(not fun.(&1)), [])

  @spec f(list(any), (any -> boolean), list(any)) :: list(any)
  defp f([x | xs], fun, res), do: f(xs, fun, if(fun.(x), do: res ++ [x], else: res))
  defp f([], _, res), do: res
end
