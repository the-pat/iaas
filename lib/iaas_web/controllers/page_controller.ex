defmodule IaasWeb.PageController do
  use IaasWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def image(conn, %{"text" => text, "size" => unparsed_size}) do
    {size, _} = Integer.parse(unparsed_size)

    binary_image = Iaas.Identicons.create(text, size)

    IO.inspect(binary_image)

    conn
    |> put_resp_content_type("image/png")
    |> send_resp(:ok, binary_image)
  end
end
