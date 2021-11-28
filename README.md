# Sender

This is a little project for playing with some functions from the `Task` module. It simulates an email sending service.

This is the result of following the book _Concurrent Data Processing in Elixir Fast, Resilient Applications with OTP, GenStage, Flow, and Broadway_ by Svilen Gospodinov

Basically it works by calling:

```Elixir
Sender.notify_all(emails)
```

Then, uncomment the several functions to see different results 😉.

## Interact with the send server

```Elixir
# start the GenServer
{:ok, pid} = GenServer.start(SendServer, [max_retries: 1])

# get the state
GenServer.call(pid, :get_state)

# send an email
GenServer.cast(pid, {:send, "hello@gmail.com"})

# send an email that will fail and see how the server handles this
GenServer.cast(pid, {:send, "konnichiwa@world.com"})
```

You could also control what will happen if the process exits:

```Elixir
{:ok, pid} = GenServer.start(SendServer, [])

GenServer.stop(pid)
```
