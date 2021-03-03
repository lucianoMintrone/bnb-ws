namespace :book_bnb do
	desc 'Recommend visited rooms'
	task :recommend_visited_rooms => :environment do |_, args|
		RecommendVisitedRooms.execute
	end
end