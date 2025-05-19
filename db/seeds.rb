require 'nokogiri'

Stop.destroy_all

#Seeds for Stops

kml_path = Rails.root.join('app', 'assets', 'data', 'cota_data')
kml_file = File.read(kml_path)

doc = Nokogiri::XML(kml_file)

#add the namespace
ns = { 'kml' => 'http://www.opengis.net/kml/2.2' }

# extract the names and coordinates from the text
all_stops = doc.xpath('//kml:Placemark', ns).map do |placemark|
  name = placemark.at_xpath('./kml:name', ns)&.text
  coord_text = placemark.at_xpath('.//kml:Point/kml:coordinates', ns)&.text

  if name && coord_text
    lon, lat, _alt = coord_text.strip.split(',')
    { name: name, latitude: lat.to_f, longitude: lon.to_f }
  end
end.compact

all_stops.each do |stop|
  Stop.create!(
    name: stop[:name],
    latitude: stop[:latitude],
    longitude: stop[:longitude]
  )
end

all_stops.each do |stop|
    puts "#{stop[:name]} => [#{stop[:latitude]}, #{stop[:longitude]}]"
end