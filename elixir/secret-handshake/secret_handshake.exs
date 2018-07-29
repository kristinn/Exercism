use Bitwise

defmodule SecretHandshake do
  @handshakes [
    {"wink", 0b1},
    {"double blink", 0b10},
    {"close your eyes", 0b100},
    {"jump", 0b1000}
  ]

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code), do: commands_r(<<code>>)

  defp commands_r(<<_::size(3), 0::size(1), code::size(4)>>), do: generate(code)
  defp commands_r(<<_::size(3), 1::size(1), code::size(4)>>), do: generate(code) |> Enum.reverse

  defp generate(code), do: generate(code, @handshakes, [])

  defp generate(code, [{handshake_text, handshake_code} | xs], result) do
    case (code &&& handshake_code) do
      ^handshake_code -> generate(code, xs, result ++ [handshake_text])
      _ -> generate(code, xs, result)
    end
  end
  defp generate(_, [], result), do: result
end
