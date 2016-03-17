defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @weekdays %{
    :monday => 1,
    :tuesday => 2,
    :wednesday => 3,
    :thursday => 4,
    :friday => 5,
    :saturday => 6,
    :sunday => 7
  }

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, schedule) do
    { year, month, day(year, month, weekday, schedule) }
  end

  defp day(year, month, weekday, schedule) do
    last_day(year, month, schedule)
    |> day_range
    |> Enum.map(fn(day) ->
      { :calendar.day_of_the_week(year, month, day), day }
    end)
    |> Enum.into(%{})
    |> Map.get(Map.get(@weekdays, weekday))
  end

  defp last_day(_,_,:teenth), do: 19
  defp last_day(_,_,:first), do: 7
  defp last_day(_,_,:second), do: 14
  defp last_day(_,_,:third), do: 21
  defp last_day(_,_,:fourth), do: 28
  defp last_day(year, month, :last),
    do: :calendar.last_day_of_the_month(year, month)

  defp day_range(last_day), do: (last_day-6)..last_day
end
