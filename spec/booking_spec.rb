require 'booking'
require 'json'

file = File.read('availability_slots.json')
availability_hash = JSON.parse(file)
availability_slots = availability_hash["availability_slots"]

describe Booking do
  let(:booking) { described_class.new(availability_slots) }
  let(:availability_slots) { availability_slots }

  it "stores available slots" do
    expect(booking.available_slots).to include({"time"=>"08:00:00",
                                                "slot_size"=>10,
                                                "doctor_id"=>1})
  end


end
