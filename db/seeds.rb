require 'nokogiri'

Stop.destroy_all

#Seeds for Stops

# worthington = Stop.create!(name: "worthington")
# puts worthington.name

kml_path = Rails.root.join('app', 'assets', 'data', 'cota_data')
kml_file = File.read(kml_path)

doc = Nokogiri::XML(kml_file)

ns = { 'kml' => 'http://www.opengis.net/kml/2.2' }

# Extract all <name> elements under <Placemark>
stop_names = doc.xpath('//kml:Placemark/kml:name', ns).map(&:text)

# Output names to the console (optional)
stop_names.each { |name| puts "Stop: #{name}" }

stop_names