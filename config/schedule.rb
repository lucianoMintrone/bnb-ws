set :environment, "development"

every :minute do
	rake "book_bnb:recommend_rooms"
end
