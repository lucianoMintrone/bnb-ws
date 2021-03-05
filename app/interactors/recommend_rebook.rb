class RecommendRebook
	def self.execute
		Booking.where(created_at: 11.months.ago.beginning_of_day...11.months.ago.end_of_day).each { |booking|
			send_recommend_room_push_notification(booking)
		}
	end

	def self.send_recommend_room_push_notification(booking)
		options = { 
			priority: 'high',
			collapse_key: 'recommend_rebook',
			data: { room_id: booking.room.id },
			notification: { 
				body: 'Repetí tu reserva de hace un año',
				title: 'Te quedaste con ganas de volver?',
				sound: 'default'
			}
		}
		fcm_client.send(booking.guest.user.firebase_token, options)
	end

	def self.fcm_client
		FCM.new("AAAAgIgUnn8:APA91bGu3L9vqrfv8CYdC_AZodVtJH0z4gBqAfThpBTedaH9FnX4Go3Www1EOYAktWS08iSx1-uKsxIcmNfPTkWsnQFKOJyGExSTNS9MTj3NCGe0n8jJsLvg3p5xzcPJ2MFTafNXvWm0")
	end
end