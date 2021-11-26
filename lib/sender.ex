defmodule Sender do
  @moduledoc """
  Documentation for `Sender`.
  """

  # def notify_all(emails) do
  #   Enum.each(emails, fn email -> Task.start(fn -> send_email(email) end) end)
  # end

  # def notify_all(emails) do
  #   emails
  #   |> Enum.map(fn email -> Task.async(fn -> send_email(email) end) end)
  #   |> Enum.map(&Task.await/1)
  # end

  # def notify_all(emails) do
  #   emails
  #   |> Task.async_stream(&send_email/1, ordered: false)
  #   |> Enum.to_list()
  # end

  def notify_all(emails) do
    Sender.EmailTaskSupervisor
    |> Task.Supervisor.async_stream_nolink(emails, &send_email/1)
    |> Enum.to_list()
  end

  def send_email("konnichiwa@world.com" = email) do
    raise "Oops, couldn't send email to #{email}"
  end

  def send_email(email) do
    3_000
    |> :rand.uniform()
    |> Process.sleep()

    IO.puts("Email sent to #{email}")
    {:ok, email}
  end
end
