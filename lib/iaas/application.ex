defmodule Iaas.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      IaasWeb.Endpoint,
      # Starts a worker by calling: Iaas.Worker.start_link(arg)
      # {Iaas.Worker, arg},
      %{
        id: Cachex,
        start: {Cachex, :start_link, [:my_cache, [limit: 100]]}
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Iaas.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    IaasWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
