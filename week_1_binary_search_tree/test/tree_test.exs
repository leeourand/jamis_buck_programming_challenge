defmodule TreeTest do
  use ExUnit.Case
  doctest Tree

  describe "inserting into the tree" do
    test "inserting into an empty tree" do
      tree = Tree.new
        |> Tree.insert(1, "foo")

      assert(Tree.search(tree, 1) == {:ok, "foo"})
    end

    test "inserting many elements" do
      tree = Tree.new
        |> Tree.insert(1, "foo")
        |> Tree.insert(2, "bar")
        |> Tree.insert(3, "baz")
        |> Tree.insert(4, "qux")

      assert(Tree.search(tree, 1) == {:ok, "foo"})
      assert(Tree.search(tree, 2) == {:ok, "bar"})
      assert(Tree.search(tree, 3) == {:ok, "baz"})
      assert(Tree.search(tree, 4) == {:ok, "qux"})
    end
  end

  describe "searching the tree" do
    test "when the element exists" do
      tree = Tree.new
        |> Tree.insert(1, "foo")

      assert(Tree.search(tree, 1) == {:ok, "foo"})
    end

    test "when the element does not exist" do
      tree = Tree.new
        |> Tree.insert(1, "foo")

      assert(Tree.search(tree, 2) == {:error, "Not found"})
    end
  end

  describe "deleting a node" do
    test "with no children" do
      tree = Tree.new
        |> Tree.insert("c", "a letter C")
        |> Tree.insert("b", "a letter B")
        |> Tree.insert("a", "a letter A")
        |> Tree.insert("d", "a letter D")
        |> Tree.delete("a")

      assert(Tree.search(tree, "a") == {:error, "Not found"})
    end

    test "with one child" do
      tree = Tree.new
        |> Tree.insert("c", "a letter C")
        |> Tree.insert("b", "a letter B")
        |> Tree.insert("a", "a letter A")
        |> Tree.insert("d", "a letter D")
        |> Tree.delete("b")

      assert(Tree.search(tree, "b") == {:error, "Not found"})
    end

    test "with two children" do
      tree = Tree.new
        |> Tree.insert("c", "a letter C")
        |> Tree.insert("b", "a letter B")
        |> Tree.insert("a", "a letter A")
        |> Tree.insert("d", "a letter D")
        |> Tree.delete("c")

      assert(Tree.search(tree, "c") == {:error, "Not found"})
    end
  end
end
