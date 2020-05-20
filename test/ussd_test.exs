defmodule UssdTest do
  use ExUnit.Case
  doctest Ussd

  test "returns machine" do
    assert Ussd.machine() == Machine
  end

  test "ussd machine can set request" do
    assert Ussd.machine().setRequest(%{
             msisdn: "233544909356",
             network: "mtn",
             session_id: "12345678",
             input: "*123"
           }) == "233544909356mtn12345678*123"
  end
end
