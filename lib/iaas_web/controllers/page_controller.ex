defmodule IaasWeb.PageController do
  use IaasWeb, :controller

  def index(conn, _params) do
    random_text = Iaas.Random.text()

    render(conn, "index.html", %{text: random_text, size: 5})
  end

  def image(conn, %{"text" => encoded_text, "size" => unparsed_size}) do
    text = URI.decode(encoded_text)
    {size, _} = Integer.parse(unparsed_size)

    {_, binary_image} = Cachex.fetch(:my_cache, {text, size}, fn(_) ->
      {:commit, Iaas.Identicons.create(text, size)}
    end)

    conn
    |> put_resp_content_type("image/png")
    |> send_resp(:ok, binary_image)
  end

  def random(conn, _params) do
    random_text = Iaas.Random.text()

    text(conn, random_text)
  end
end
