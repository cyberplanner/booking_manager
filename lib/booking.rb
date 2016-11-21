class Booking
  OPENING_TIME = "08:00:00"
  CLOSING_TIME = "15:00:00"
  attr_reader :available_slots

  def initialize(available_slots)
    @available_slots = available_slots
  end

  def book_appointment(time)
    @booked_appointment = @available_slots.find { |slot| slot["time"] >= time }
    @booked_appointment["time"]
  end


end
