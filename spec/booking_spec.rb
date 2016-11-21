require 'booking'
require 'json'



describe Booking do
  file = File.read('availability_slots.json')
  slots_hash = JSON.parse(file)
  let(:booking_slots) { slots_hash["availability_slots"] }
  let(:booking) { described_class.new(booking_slots) }

  it "stores available slots" do
    expect(booking.available_slots).to include({"time"=>"08:00:00",
                                                "slot_size"=>10,
                                                "doctor_id"=>1})
  end


end
