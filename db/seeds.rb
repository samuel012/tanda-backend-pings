# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


hsh = Hash.new
hsh[0] = [1459209100, 1459210448, 1459210748, 1459211048, 1459211348, 1459211648, 1459211948, 1459212248, 1459212548, 1459212848, 1459213148, 1459213448]
hsh[1] = [1459198796, 1459199096, 1459199396, 1459199696, 1459199996, 1459200296, 1459200596, 1459200896, 1459201196, 1459201496, 1459201796, 1459202096, 1459202396, 1459202696]
["5581db36-57e7-4274-a36d-0c105c70fbfa", "5225a416-3394-4e9f-9d97-e371d7615197"].each_with_index do |deviceid, idx|
  puts '--------------'
  puts deviceid
  puts idx.to_s
  puts hsh[idx]
  hsh[idx].each do |ping|
    device_input_params = {
      identifier: deviceid,
      pings_attributes: [
        { datetimestamp: Time.at(ping).utc }
      ]
    }
    Device.create!(device_input_params)
  end
end
