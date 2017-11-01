defmodule Week4Image.Canvas do
  alias Week4Image.Canvas
  defstruct width: 0, height: 0, pixels: %{}

  def new(width \\ 10, height \\ 10) do
    %__MODULE__{width: width, height: height}
  end

  def draw_pixel(canvas, coords, color) do
    %{canvas | pixels: Map.put(canvas.pixels, coords, color)}
  end

  def read_pixel(canvas, coords) do
    Map.fetch!(canvas.pixels, coords)
  end

  def draw_line(canvas, start, finish, color \\ {0,0,0})

  def draw_line(canvas, {x, y}, {x1, y1}, color) when abs(y1 - y) > abs(x1 - x) do
    breshenham({y, x}, {y1, x1})
    |> Enum.map(fn {x, y} -> {y, x} end)
    |> Enum.reduce(canvas, fn coord, new_canvas ->
      Canvas.draw_pixel(new_canvas, coord, color)
    end)
  end

  def draw_line(canvas, start, finish, color) do
    breshenham(start, finish)
    |> Enum.reduce(canvas, fn coord, new_canvas ->
      Canvas.draw_pixel(new_canvas, coord, color)
    end)
  end

  def breshenham({x, y}, {x1, y1}) do
    deltax = x1 - x
    deltay = y1 - y
    deltaerr = abs(deltay / deltax)
    error = 0

    {_, _, coords} = Enum.reduce(x..x1, {error, y, %{}}, fn x_pos, {e, y_pos, coords} ->
      coords = Map.put(coords, x_pos, y_pos)

      new_err = e + deltaerr
      {new_err, new_y} = if new_err >= 0.5 do
        new_y = cond do
          deltay > 0 ->
            y_pos + 1
          deltay < 0 ->
            y_pos - 1
        end
        {new_err - 1, new_y}
      else
        {new_err, y_pos}
      end

      {new_err, new_y, coords}
    end)
    coords
  end
end
