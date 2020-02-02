require 'net/http'

u = User.create email: 'admin@admin.com', password: '12345678'
u.add_role :admin

http = Net::HTTP.new('raw.githubusercontent.com', 443); http.use_ssl = true
estados = JSON.parse http.get('/celsodantas/br_populate/master/states.json').body

 Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
   load seed
end



# City.where(latitude: nil).each{|c| coord=Geocoder.search("#{c.name}, #{c.state.name}, Brasil")&.first&.coordinates; c.latitude=coord[0] if coord; c.longitude=coord[1] if coord; c.save;}
