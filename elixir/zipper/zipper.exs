defmodule BinTree do
  @moduledoc """
  A node in a binary tree.

  `value` is the value of a node.
  `left` is the left subtree (nil if no subtree).
  `right` is the right subtree (nil if no subtree).
  """
  @type t :: %BinTree{ value: any, left: BinTree.t | nil, right: BinTree.t | nil }
  defstruct value: nil, left: nil, right: nil
end

defmodule Zipper do
  @type trail :: [ { :left, any, BinTree.t } | { :right, any, BinTree.t } ]
  @type t :: { BinTree.t, trail }

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BT.t) :: Z.t
  def from_tree(nil), do: nil
  def from_tree(bt) do
    {bt, []}
  end

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Z.t) :: BT.t
  def to_tree({tree, []}), do: tree
  def to_tree(zipper) do
    zipper
    |> up
    |> to_tree
  end

  @doc """
  Get the value of the focus node.
  """
  @spec value(Z.t) :: any
  def value({%{value: value}, trail}) do
    value
  end

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Z.t) :: Z.t | nil
  def left({%{left: nil}, _}), do: nil
  def left({%{right: right, value: value, left: left}, trail}) do
    {left, [{:left, value, right} | trail]}
  end

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Z.t) :: Z.t | nil
  def right({%{right: nil}, _}), do: nil
  def right({%{right: right, value: value, left: left}, trail}) do
    {right, [{ :right, value, left } | trail]}
  end

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Z.t) :: Z.t
  def up({tree, []}), do: nil
  def up({tree, [{:left, value, right } | trail]}) do
    {%BinTree{value: value, left: tree, right: right}, trail}
  end
  def up({tree, [{:right, value, left } | trail]}) do
    {%BinTree{value: value, left: left, right: tree}, trail}
  end

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Z.t, any) :: Z.t
  def set_value({tree, trail}, value) do
    {%BinTree{tree | value: value}, trail}
  end

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Z.t, BT.t) :: Z.t
  def set_left({tree, trail}, left) do
    {%BinTree{tree | left: left}, trail}
  end

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Z.t, BT.t) :: Z.t
  def set_right({tree, trail}, right) do
    {%BinTree{tree | right: right}, trail}
  end
end
