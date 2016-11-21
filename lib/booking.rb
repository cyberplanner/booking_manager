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
    within_working_hours?(time)
    book_time_slot(time)
  end

  private

  def within_working_hours?(time)
    raise "Sorry, you can not book an appointment before 8:00AM" if time < OPENING_TIME
    raise "Sorry, you can not book an appointment after 3:00PM" if time > CLOSING_TIME
  end

  def book_time_slot(time)
    @booked_appointment = @available_slots.find { |slot| slot["time"] >= time }
    appointment_booked?(@booked_appointment)
    push_to_booked_slots(@booked_appointment)
    @booked_appointment["time"]
  end

  def appointment_booked?(appointment)
    raise "Sorry, there's no more avaiable appointments today" if appointment.nil?
  end

  def push_to_booked_slots(appointment)
    @booked_slots << @available_slots.delete(appointment)
  end
end
