defmodule CustomSet do
  # This lets the compiler check that all Set callback functions have been
  # implemented.
  @behaviour Set

  # require Record
  # Record.defrecord :custom_set, CustomSet, [list: nil]
  # @type custom_set :: record(:custom_set, list: [any])
  defstruct list: []

  def new, do: %CustomSet{}
  def new(enum) do
    list = enum
    |> Enum.map(&({&1, nil}))
    |> Enum.into(%{})
    |> Map.keys()

    %CustomSet{list: list}
  end

  def delete(%{list: list}, item) do
    list |> Enum.filter(&(&1 !== item)) |> new
  end

  def equal?(%{list: list1}, %{list: list2}) do
    Enum.sort(list1) == Enum.sort(list2)
  end

  def difference(%{list: list}, other) do
    list |> Enum.filter(&(!member?(other, &1))) |> new
  end

  def disjoint?(%{list: list}, other) do
    list |> Enum.all?(&(!member?(other, &1)))
  end

  def empty(set) do
    new
  end

  def intersection(%{list: list}, other) do
    list |> Enum.filter(&(member?(other, &1))) |> new
  end

  def member?(%{list: list}, value) do
    list |> Enum.member?(value)
  end

  def put(%{list: list}, value) do
    new([value | list])
  end

  def size(%{list: list}) do
    length(list)
  end

  def subset?(%{list: list}, other) do
    list |> Enum.all?(&(member?(other, &1)))
  end

  def to_list(%{list: list}) do
    list
  end

  def union(%{list: list1}, %{list: list2}) do
    new(list1 ++ list2)
  end
end
