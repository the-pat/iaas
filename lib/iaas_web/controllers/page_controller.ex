defmodule IaasWeb.PageController do
  use IaasWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def image(conn, %{"text" => text, "size" => unparsed_size}) do
    {size, _} = Integer.parse(unparsed_size)

    {_, binary_image} = Cachex.fetch(:my_cache, {text, size}, fn(_) ->
      {:commit, Iaas.Identicons.create(text, size)}
    end)

    conn
    |> put_resp_content_type("image/jpeg")
    |> send_resp(:ok, binary_image)
  end
end
