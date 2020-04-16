defmodule IaasWeb.PageController do
  use IaasWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
