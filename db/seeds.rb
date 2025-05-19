require 'nokogiri'

Par.destroy_all

#Seeds for Stops

kml_path = Rails.root.join('app', 'assets', 'data', 'cota_data')
kml_file = File.read(kml_path)

doc = Nokogiri::XML(kml_file)

#add the namespace
ns = { 'kml' => 'http://www.opengis.net/kml/2.2' }

# extract the names and coordinates from the text
all_pars = doc.xpath('//kml:Placemark', ns).map do |placemark|
  name = placemark.at_xpath('./kml:name', ns)&.text
  coord_text = placemark.at_xpath('.//kml:Point/kml:coordinates', ns)&.text

  if name && coord_text
    lon, lat, _alt = coord_text.strip.split(',')
    { name: name, latitude: lat.to_f, longitude: lon.to_f }
  end
end.compact

all_pars.each do |par|
  Par.create!(
    name: par[:name],
    latitude: par[:latitude],
    longitude: par[:longitude]
  )
end

all_pars.each do |par|
    puts "#{par[:name]} => [#{par[:latitude]}, #{par[:longitude]}]"
end