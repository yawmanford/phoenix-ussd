defmodule Machine do
  @moduledoc """
  Documentation for Machine.
  """

  @doc """
  Ussd.machine.setRequest()

  ## Examples

      iex> Ussd.machine.setRequest(%{msisdn: "233544909356", network: "mtn", session_id: "12345678", input: "*123"})
      "233544909356mtn12345678*123"

  """

  def setRequest(%{msisdn: msisdn, network: network, session_id: session_id, input: input}) do
    msisdn <> network <> session_id <> input
  end
end
