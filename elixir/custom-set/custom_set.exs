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
    %CustomSet{list: enum |> Enum.uniq |> Enum.sort}
  end

  def delete(set, item) do
    set.list -- [item] |> new
  end

  def equal?(set1, set2) do
    set1.list == set2.list
  end

  def difference(set, other) do
    set.list |> Enum.filter(&(!member?(other, &1))) |> new
  end

  def disjoint?(set, other) do
    set.list |> Enum.all?(&(!member?(other, &1)))
  end

  def empty(set) do
    new
  end

  def intersection(set, other) do
    set.list |> Enum.filter(&(member?(other, &1))) |> new
  end

  def member?(set, value) do
    set.list |> Enum.member?(value)
  end

  def put(set, value) do
    [value | set.list] |> new
  end

  def size(set) do
    set.list |> length
  end

  def subset?(set, other) do
    set.list |> Enum.all?(&(member?(other, &1)))
  end

  def to_list(set) do
    set.list
  end

  def union(set, other) do
    set.list ++ other.list |> new
  end
end
