defmodule Tree do
  defstruct key: nil,
    value: nil,
    right: nil,
    left: nil

  def new do
    nil
  end

  def insert(nil, key, value) do
    %__MODULE__{ key: key, value: value }
  end

  def insert(tree = %{key: key}, key, value) do
    %{tree | key: value}
  end

  def insert(tree = %{key: root_key}, key, value) when key > root_key do
    %{tree | right: insert(tree.right, key, value)}
  end

  def insert(tree = %{key: root_key}, key, value) when key < root_key do
    %{tree | left: insert(tree.left, key, value)}
  end

  def search(%{key: key, value: value}, key) do
    {:ok, value}
  end

  def search(tree = %{key: node_key}, key) when key > node_key do
    search(tree.right, key)
  end

  def search(tree = %{key: node_key}, key) when key < node_key do
    search(tree.left, key)
  end

  def search(nil, _key) do
    {:error, "Not found"}
  end

  def delete(%{right: nil, left: nil}, _key) do
    nil
  end

  def delete(tree = %{key: node_key}, key) when key > node_key do
    %{tree | right: delete(tree.right, key)}
  end

  def delete(tree = %{key: node_key}, key) when key < node_key do
    %{tree | left: delete(tree.left, key)}
  end

  def delete(tree = %{key: key, right: %__MODULE__{}, left: nil}, key) do
    tree.right
  end

  def delete(tree = %{key: key, left: %__MODULE__{}, right: nil}, key) do
    tree.left
  end

  def delete(tree = %{key: key, left: %__MODULE__{}, right: %__MODULE__{}}, key) do
     replacement = min(tree.left)
     %{tree | key: replacement.key, value: replacement.value, left: delete(tree.left, replacement.key)}
  end

  defp min(%{left: nil} = tree) do
    tree
  end

  defp min(%{left: %__MODULE__{}} = tree) do
    min(tree.left)
  end
end
