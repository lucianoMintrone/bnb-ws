puts "Create default Host..."
user1 = User.find_or_create_by(email: 'jaidoniles@gmail.com') do |user|
	user.first_name = 'Jaidon'
	user.last_name = 'Iles'
	user.save!
end

Host.find_or_create_by(user: user1) do |host|
	host.save!
end
