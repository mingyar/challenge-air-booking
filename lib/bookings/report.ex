defmodule Flightex.Bookings.Report do
  alias Flightex.Bookings.Agent, as: BookingAgent
  alias Flightex.Bookings.Booking

  def generate(filename \\ "report.csv") do
    booking_list = build_booking_list()

    File.write(filename, booking_list)
  end

  def build_booking_list do
    BookingAgent.start_link(%{})

    BookingAgent.list_all()
    |> Map.values()
    |> Enum.map(&booking_string/1)
  end

  def booking_string(%Booking{
        complete_date: complete_date,
        local_origin: local_origin,
        local_destination: local_destination,
        user_id: user_id,
        id: id
      }) do
    "#{user_id},#{local_origin},#{local_destination},#{complete_date}\n"
  end
end
