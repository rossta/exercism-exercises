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
    schedule_day_range(year, month, schedule)
    |> Enum.map(fn(day) ->
      { :calendar.day_of_the_week(year, month, day), day }
    end)
    |> Enum.into(%{})
    |> Map.get(Map.get(@weekdays, weekday))
  end

  defp schedule_day_range(year, month, schedule) do
    last_day_in_schedule = case schedule do
      :first -> 7
      :second -> 14
      :teenth -> 19
      :third -> 21
      :fourth -> 28
      :last -> :calendar.last_day_of_the_month(year, month)
    end

    (last_day_in_schedule-6)..last_day_in_schedule
  end
end
