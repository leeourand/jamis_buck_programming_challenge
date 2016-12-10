# Tree

This is a solution to [Jamis Buck's first Weekly Programming Challenge](https://medium.com/@jamis/weekly-programming-challenge-1-55b63b9d2a1#.dsxrmigmg)

Usage:

```elixir
tree = Tree.new
|> Tree.insert("c", "a letter C")
|> Tree.insert("b" "check it out, a letter B")
|> Tree.insert("a", "whoa now, this is a letter A")
|> Tree.insert("d", "ok, we've got a D")
|> Tree.delete("c")

Tree.search(tree, "a")
# => "whoa now, this is a letter A"

Tree.search(tree, "c")
# => {:error, "Not found"}
```
