defmodule Bob do
  def hey(input) do
    cond do
      # The input is a shout if
      #   1) It has one or more letter
      #   2) It has no lower case letters
      input =~ ~r/\p{L}+/u and !(input =~ ~r/\p{Ll}+/u) ->
        if String.ends_with?(input, "?") do
          "Calm down, I know what I'm doing!"
        else
          "Whoa, chill out!"
        end

      # The input is a question if
      #   1) It has one or more digit, letter or underscore
      #   2) It ends with a question mark
      input =~ ~r/\w+\?$/u ->
        "Sure."

      # The input is empty if
      #   1) It includes nothing but white spaces (tabs, spaces, etc.)
      input =~ ~r/^\s*$/u ->
        "Fine. Be that way!"

      # Give up if we cannot classify the input
      true ->
        "Whatever."
    end
  end
end
