namespace :book_bnb do
	desc 'Recommend rebook'
	task :recommend_rebook => :environment do |_, args|
		RecommendRebook.execute
	end
end