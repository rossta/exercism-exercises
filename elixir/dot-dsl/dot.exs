defmodule Graph do
  defstruct attrs: [], nodes: [], edges: []
end

defmodule Dot do
  defmacro graph(ast) do
    ast |> parse |> Macro.escape
  end

  defp parse([do: ast]), do: parse(ast, %Graph{})
  defp parse(nil, graph), do: graph

  defp parse({:__block__, _, []}, graph), do: graph
  defp parse({:__block__, _, [head | tail]}, graph), do: parse({:__block__, [], tail}, parse(head, graph))

  defp parse({:graph, _, [[attr]]}, graph), do: update_attrs(graph, attr)
  defp parse({:graph, _, _}, graph), do: graph

  defp parse({:--, _, [{var1, _, _}, {var2, _, nil}]}, graph), do: update_edges(graph, var1, var2, [])
  defp parse({:--, _, [{var1, _, _}, {var2, _, [[]]}]}, graph), do: update_edges(graph, var1, var2, [])
  defp parse({:--, _, [{var1, _, _}, {var2, _, [[arg]]}]}, graph), do: update_edges(graph, var1, var2, [arg])

  defp parse({var, _, nil}, graph), do: update_nodes(graph, var, [])
  defp parse({var, _, [[]]}, graph), do: update_nodes(graph, var, [])
  defp parse({var, _, [[{kw, val}]]}, graph), do: update_nodes(graph, var, [{kw, val}])

  defp parse(_, _), do: raise ArgumentError

  defp update_nodes(graph, var, arg) do
    update_sorted_value(graph, :nodes, {var, arg})
  end

  defp update_edges(graph, var1, var2, arg) do
    update_sorted_value(graph, :edges, {var1, var2, arg})
  end

  defp update_attrs(graph, attr) do
    update_sorted_value(graph, :attrs, attr)
  end

  defp update_sorted_value(graph, key, val) do
    Map.update(graph, key, [val], &(Enum.sort [val | &1]))
  end
end
