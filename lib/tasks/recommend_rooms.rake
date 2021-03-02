namespace :book_bnb do
	desc 'Recommend rooms'
	task :recommend_rooms => :environment do |_, args|
		RecommendRooms.execute
	end
end