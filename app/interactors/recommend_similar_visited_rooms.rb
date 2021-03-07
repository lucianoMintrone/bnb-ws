class RecommendSimilarVisitedRooms
  def self.execute
    Guest.joins(:visited_rooms).each { |guest|
      visited_room = VisitedRoom.where(guest: guest, similar_room_push_has_been_sent: false)
                         .select { |visited_room|
                           visited_room.room.bookings.empty? || visited_room.room.bookings.where.not(guest_id: guest.id).exists?
                         }.first
      next unless visited_room
      room = visited_room.room
      point = [room.latitude.to_f, room.longitude.to_f]
      recommended_room =  Room.within(3, :units => :kms, :origin => point)
                   .where(number_of_guests: room.number_of_guests)
                   .where(room_type: room.room_type)
                   .first
      send_similar_recommend_room_push_notification(visited_room, recommended_room.id)
      visited_room.update! similar_room_push_has_been_sent: true
    }
  end

  def self.send_similar_recommend_room_push_notification(visited_room, room_id)
    options = {
        priority: 'high',
        collapse_key: 'similar_recommend_visited_room',
        data: { room_id: room_id },
        notification: {
            body: 'Viste alojamientos similares a este, queres reservarlo?',
            title: 'No te lo pierdas!',
            sound: 'default'
        }
    }
    fcm_client.send(visited_room.guest.user.firebase_token, options)
  end

  def self.fcm_client
    FCM.new("AAAAgIgUnn8:APA91bGu3L9vqrfv8CYdC_AZodVtJH0z4gBqAfThpBTedaH9FnX4Go3Www1EOYAktWS08iSx1-uKsxIcmNfPTkWsnQFKOJyGExSTNS9MTj3NCGe0n8jJsLvg3p5xzcPJ2MFTafNXvWm0")
  end
end