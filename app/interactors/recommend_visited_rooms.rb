class RecommendVisitedRooms
	def self.execute
		Guest.joins(:visited_rooms).each { |guest|
			visited_room = VisitedRoom.where(guest: guest, push_notification_has_been_sent: false)
				.select { |visited_room| 
					visited_room.room.bookings.empty? || visited_room.room.bookings.where.not(guest_id: guest.id).exists?
				}.first
			next unless visited_room
			send_recommend_room_push_notification(visited_room)
			visited_room.update! push_notification_has_been_sent: true
		}
	end

	def self.send_recommend_room_push_notification(visited_room)
		options = { 
			priority: 'high',
			collapse_key: 'recommend_visited_room',
			data: { room_id: visited_room.room.id },
			notification: { 
				body: 'Viste este alojamiento, queres reservarlo?',
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