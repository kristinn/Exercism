defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    # Replace everything that is not
    #   *) A letter
    #   *) A number
    #   *) A white space
    #   *) An underscore
    #   *) A hyphen
    #
    # Then split the string up into a list using white space and underscore as separators.
    word_count(
      String.downcase(sentence)
      |> String.replace(~r/[^\w\s-]/u, "")
      |> String.split(~r/[\s_]/u, trim: true),
      Map.new()
    )
  end

  defp word_count([w | xs], count_map) do
    # Increment the count for each word in the map by one.
    # Set the "old value" to 0 if it's nil.
    # The "old value" for all new items are nil.
    {_, count_map} =
      Map.get_and_update(count_map, w, fn x ->
        x = if x == nil, do: 0, else: x

        {x, x + 1}
      end)

    word_count(xs, count_map)
  end

  defp word_count([], count_map), do: count_map
end
