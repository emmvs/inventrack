# db/seeds.rb
puts 'Cleaning Database! ๐งน'
Warehouse.destroy_all
Item.destroy_all

puts 'Database is clean! ๐งผ'

puts 'Creating Warehouses & Items... ๐ ๐ฑ ๐ ๐'

50.times do
  Warehouse.create!(
    name: Faker::Name.unique.name,
    address: Faker::Address.street_address,
    capacity: rand(1000)
  )
end

500.times do
  Item.create!(
    name: Faker::FunnyName.unique.name,
    type_of_item: rand(0..5),
    warehouse_id: Warehouse.all.sample.id
  )
end
