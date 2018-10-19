defmodule Guess do
  # guard
  def guess_num(a, b) when a > b, do: guess_num(b, a)

  def guess_num(low, high) do
    answer = IO.gets("Maybe your thinking of #{mid(low, high)}?\n")

    case String.trim(answer) do
      "bigger" ->
        bigger(low, high)

      "smaller" ->
        smaller(low, high)

      "yes" ->
        "Number guessed"

      _ ->
        IO.puts(~s{Type "bigger", "smaller" or "yes"})
        guess_num(low, high)
    end
  end

  def mid(low, high) do
    div(low + high, 2)
  end

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess_num(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess_num(low, new_high)
  end
end
