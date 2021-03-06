class AddSimilarRoomPushHasBeenSentToVisitedRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :visited_rooms, :similar_room_push_has_been_sent, :boolean, default: false, null: false
  end
end
