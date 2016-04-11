defmodule Squares do
  @moduledoc """
  Calculate sum of squares, square of sums, difference between two sums from 1 to a given end number.
  """

  @doc """
  Calculate sum of squares from 1 to a given end number.
  Given by formula: http://www.trans4mind.com/personal_development/mathematics/series/sumNaturalSquares.htm
  # def sum_of_squares
  """
  @spec sum_of_squares(pos_integer) :: pos_integer
  def sum_of_squares(number) do
    (number * (number + 1) * (2 * number + 1)) / 6
  end

  @doc """
  Calculate square of sums from 1 to a given end number.
  Based on formula: http://www.trans4mind.com/personal_development/mathematics/series/sumNaturalNumbers.htm
  """
  @spec square_of_sums(pos_integer) :: pos_integer
  def square_of_sums(number) do
    :math.pow(number * (number + 1) / 2, 2)
  end

  @doc """
  Calculate difference between sum of squares and square of sums from 1 to a given end number.
  """
  @spec difference(pos_integer) :: pos_integer
  def difference(number) do
    square_of_sums(number) - sum_of_squares(number)
  end

end
