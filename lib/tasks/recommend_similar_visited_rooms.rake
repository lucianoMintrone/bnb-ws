namespace :book_bnb do
  desc 'Recommend similar visited rooms'
  task :recommend_similar_visited_rooms => :environment do |_, args|
    RecommendSimilarVisitedRooms.execute
  end
end