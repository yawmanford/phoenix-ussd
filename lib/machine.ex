defmodule Machine do
  @moduledoc """
  Documentation for Machine.
  """

  @doc """
  Ussd.machine().set()

  ## Examples
      iex> Ussd.machine().set(%{msisdn: "233544909356", network: "mtn", session_id: "12345678", input: "*123"})
      %{action: 'input', message: 'Hello world!!'}
  """

  defstruct [:msisdn, :network, :session_id, :input]
  @session_id_exception 'session_id needs to be set before ussd machine can run.'

  def set(%{msisdn: msisdn, network: network, session_id: session_id, input: input} = request) do
    request |> run()
  end

  def run(request) do
    case request[:session_id] do
      nil -> raise @session_id_exception
      ""  -> raise @session_id_exception
      _   -> true
    end

    response('Hello world!!', 'input')
  end

  def response(message, action) do
    %{
      message: message,
      action: action
    }
  end
end
