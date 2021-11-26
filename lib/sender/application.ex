defmodule Sender.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # {Task.Supervisor, name: Sender.EmailTaskSupervisor}
      %{
        id: Sender.EmailTaskSupervisor,
        start: {
          Task.Supervisor,
          :start_link,
          [[name: Sender.EmailTaskSupervisor]]
        }
      }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sender.Supervisor]
    Supervisor.start_link(children, opts)
  end
end