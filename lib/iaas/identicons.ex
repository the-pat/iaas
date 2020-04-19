defmodule Iaas.Identicons do
  alias Iaas.Identicons.Grid

  def create(text, size) do
    hashing_algo = get_hashing_algo(size)

    %Grid{}
    |> get_hash(text, hashing_algo)
    |> get_color()
    |> get_grid(size)
    |> filter_odd_squares()
    |> build_pixel_map(size)
    |> draw_image(size)
  end

  defp get_hashing_algo(size) when size == 10, do: :sha512
  defp get_hashing_algo(size) when size == 9, do: :sha384
  defp get_hashing_algo(size) when size == 8, do: :sha256
  defp get_hashing_algo(size) when size == 7, do: :sha224
  defp get_hashing_algo(size) when size == 6, do: :sha
  defp get_hashing_algo(size) when size > 0 and size < 6, do: :md5

  defp get_hash(grid, text, hashing_algo) do
    hex =
      :crypto.hash(hashing_algo, text)
      |> :binary.bin_to_list()

    %Grid{grid | hex: hex}
  end

  defp get_color(%Grid{hex: [r, g, b | _]} = grid) do
    %Grid{grid | color: {r, g, b}}
  end

  defp get_grid(%Grid{hex: hex} = grid, size) do
    row_length = Integer.floor_div(size + 1, 2)

    unfiltered_matrix =
      Enum.chunk_every(hex, row_length, row_length)
      |> Enum.map(&mirror_row(&1, size))
      |> List.flatten()
      |> Enum.with_index()

    %Grid{grid | matrix: unfiltered_matrix}
  end

  defp mirror_row(row, size) do
    length = Integer.floor_div(size, 2)

    reversed_row =
      Enum.slice(row, 0, length)
      |> Enum.reverse()

    row ++ reversed_row
  end

  defp filter_odd_squares(%Grid{matrix: unfiltered_matrix} = grid) do
    filtered_matrix =
      Enum.filter(unfiltered_matrix, fn {number, _} ->
        rem(number, 2) == 0
      end)

    %Grid{grid | matrix: filtered_matrix}
  end

  defp build_pixel_map(%Grid{matrix: matrix} = grid, size) do
    pixel_map =
      Enum.map(matrix, fn {_, index} ->
        horizontal = rem(index, size) * 60
        vertical = div(index, size) * 60

        top_left = {horizontal, vertical}
        bottom_right = {horizontal + 60, vertical + 60}

        {top_left, bottom_right}
      end)

    %Grid{grid | pixel_map: pixel_map}
  end

  defp draw_image(%Grid{color: color, pixel_map: pixel_map}, size) do
    pixels = size * 60

    image = :egd.create(pixels, pixels)
    fill = :egd.color(color)

    Enum.each(pixel_map, fn {start, stop} ->
      :egd.filledRectangle(image, start, stop, fill)
    end)

    :egd.render(image)
  end
end
