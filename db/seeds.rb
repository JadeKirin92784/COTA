require 'nokogiri'

Stop.destroy_all

#Seeds for Stops

worthington = Stop.create!(name: "worthington")
puts worthington.name
