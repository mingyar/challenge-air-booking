defmodule Flightex do
  alias Flightex.Bookings.CreateOrUpdate

  def start_agents do
    Flightex.Bookings.Agent.start_link(%{})
    Flightex.Users.Agent.start_link(%{})
  end

  defdelegate create_or_update_booking(params), to: CreateOrUpdate, as: :call
end
