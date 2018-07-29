defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift), do: to_string(r(String.to_charlist(text), shift, []))

  defp r(text, 0, _), do: text
  defp r(text, 26, _), do: text
  defp r([x | xs], shift, res) when x in ?a..?z, do: r(xs, shift, res ++ [c(x, shift, ?a, ?z)])
  defp r([x | xs], shift, res) when x in ?A..?Z, do: r(xs, shift, res ++ [c(x, shift, ?A, ?Z)])
  defp r([x | xs], shift, res), do: r(xs, shift, res ++ [x])
  defp r([], _, res), do: res

  defp c(x, shift, min, max) when x + shift > max, do: x + shift - max + min - 1
  defp c(x, shift, _, _), do: x + shift
end
