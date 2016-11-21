class Booking
  OPENING_TIME = "08:00:00"
  CLOSING_TIME = "15:00:00"
  attr_reader :available_slots
  attr_reader :booked_slots

  def initialize(available_slots)
    @available_slots = available_slots
    @booked_slots = []
  end

  def book_appointment(time)
    raise "Sorry, you can not book an appointment before 8:00AM" if time < OPENING_TIME
    raise "Sorry, you can not book an appointment after 3:00PM" if time > CLOSING_TIME
    @booked_appointment = @available_slots.find { |slot| slot["time"] >= time }
    raise "Sorry, there's no more avaiable appointments today" if @booked_appointment.nil?
    @booked_slots << @available_slots.delete(@booked_appointment)
    @booked_appointment["time"]
  end


end
