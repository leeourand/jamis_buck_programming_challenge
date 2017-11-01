defmodule Week4Image.CanvasTest do
  use ExUnit.Case
  alias Week4Image.Canvas

  test "drawing a pixel" do
    canvas = Canvas.new
    |> Canvas.draw_pixel({0,4}, {0,0,0})

    assert Canvas.read_pixel(canvas, {0,4}) == {0,0,0}
  end

  test "drawing a line in first octant" do
    canvas = Canvas.new(4,4)
    |> Canvas.draw_line({0, 3}, {3, 1})

    assert Canvas.read_pixel(canvas, {0,3}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {1,2}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {2,2}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {3,1}) == {0,0,0}
  end

  test "drawing a line in the second octant" do
    canvas = Canvas.new(4,4)
    |> Canvas.draw_line({0, 3}, {2, 0})

    assert Canvas.read_pixel(canvas, {0,3}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {1,2}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {1,1}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {2,0}) == {0,0,0}
  end

  test "drawing a line in the third octant" do
    canvas = Canvas.new(4,4)
    |> Canvas.draw_line({3, 0}, {1, 3})

    assert Canvas.read_pixel(canvas, {3,0}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {2,1}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {2,2}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {1,3}) == {0,0,0}
  end

  test "drawing a line in the fourth octant" do
    canvas = Canvas.new(4,4)
    |> Canvas.draw_line({3, 3}, {0, 2})

    assert Canvas.read_pixel(canvas, {3,3}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {2,3}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {1,2}) == {0,0,0}
    assert Canvas.read_pixel(canvas, {0,2}) == {0,0,0}
  end
end
