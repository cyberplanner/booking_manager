require 'booking'
require 'json'
require 'pry'


describe Booking do
  file = File.read('availability_slots.json')
  slots_hash = JSON.parse(file)
  let(:booking_slots) { slots_hash["availability_slots"] }
  let(:booking) { described_class.new(booking_slots) }

  describe "Initialized with available time slots" do
    it "Stores available slots" do
      expect(booking.available_slots).to include({
        "time"=>"08:00:00",
        "slot_size"=>10,
        "doctor_id"=>1
        })
    end
  end

  describe "Booking appointments" do
    context "When time slot is avaiable" do
      it 'returns the time for the next available appointment' do
        expect(booking.book_appointment("08:10:00")).to eq "08:10:00"
        expect(booking.booked_slots[0]).to eq ({
        "time"=>"08:10:00",
        "slot_size"=>10,
        "doctor_id"=>1
        })
      end

      it "removes the booked appointments from the available slots" do
        booking.book_appointment("10:00:00")
        expect(booking.available_slots).not_to include({
          "time"=>"10:00:00",
          "slot_size"=>10,
          "doctor_id"=>1
          })
      end

      it "could book a time slot twice if the second doctor is available" do
        booking.book_appointment("08:00:00")
        expect(booking.book_appointment("08:00:00")).to eq "08:00:00"
      end
    end

    context "When time slot is not available" do
      it "books the next available time slot" do
        expect(booking.book_appointment("08:10:00")).to eq "08:20:00"
      end

      it "raises an error when there is no more available slots" do
        booking.book_appointment("15:00:00")
        # binding.pry
        expect{ booking.book_appointment("15:00:00") }.to raise_error("Sorry, there's no more avaiable appointments today")
      end
    end
  end


end
