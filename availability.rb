#! /usr/bin/env ruby
require './lib/booking'
require 'json'
require 'rainbow'

file = File.read('availability_slots.json')
slots_hash = JSON.parse(file)
available_slots = slots_hash["availability_slots"]

booking = Booking.new(available_slots)
input_time = ARGV[0]

if input_time.nil?
  puts "------------"
  puts Rainbow("ERROR:").underline.bright + Rainbow(" Appointment's time can not be left empty, please enter appointment's after ").red + Rainbow("'./availability.rb'").yellow + Rainbow("!").red
  puts "------------"
else
  formated_time = input_time + ":00"
  booking_time = booking.book_appointment(formated_time)
  puts "------------"
  puts Rainbow("Your appointment's time is:").underline.bright + Rainbow(" #{booking_time[0..-4]}").underline.blink.green
  puts ""
  puts Rainbow("Have a nice day!").red
  puts "------------"
end
