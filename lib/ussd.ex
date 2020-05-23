defmodule Ussd do
  @moduledoc """
  Documentation for Ussd.
  """

  @doc """
  Ussd

  ## Examples

      iex> 
           |> Ussd.request(%{msisdn: "233544909356", network: "mtn", session_id: "12345678", input: "*123"})
           |> Ussd.state(Hello)
           |> Ussd.run()
           %{
              action: 'input',
              message: %{
                initial_state: Hello,
                input: "*123",
                msisdn: "233544909356",
                network: "mtn",
                session_id: "12345678"
              }
            }

  """

  @session_id_exception 'session_id needs to be set before ussd can run.'

  def request(request) do
    request
  end

  def state(request, state) do
    Map.put(request, :initial_state, state)
  end

  def run(request) do
    case request[:session_id] do
      nil -> raise @session_id_exception
      ""  -> raise @session_id_exception
      _   -> true
    end

    request
    |> response('input')
  end

  def response(message, action) do
    %{
      message: message,
      action: action
    }
  end
end
