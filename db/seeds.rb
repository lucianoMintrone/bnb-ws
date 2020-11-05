puts "Create default Host..."
user1 = User.find_or_create_by(email: 'jaidoniles@gmail.com') do |user|
	user.first_name = 'Jaidon'
	user.last_name = 'Iles'
	user.save!
end

Host.find_or_create_by(user: user1) do |host|
	host.save!
end

puts "Create default RoomTypes..."
RoomType.find_or_create_by(name: :entire_place) do |room_type|
	room_type.displayed_name = 'Departamento entero'
	room_type.save!
end
RoomType.find_or_create_by(name: :private_room) do |room_type|
	room_type.displayed_name = 'Habitación privada'
	room_type.save!
end
RoomType.find_or_create_by(name: :shared_room) do |room_type|
	room_type.displayed_name = 'Habitación compartida'
	room_type.save!
end