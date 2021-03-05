require 'fcm'

class ChatsController < ApiController

  def send_message
    ##message = params[:message]
    booking = Booking.find(params[:booking_id])
    if booking.guest.user.id == user.id
      receiver = booking.host.user
    else
      receiver = booking.guest.user
    end
    send_chat_notification(user, booking.id, receiver)
    render_successful_response("ok")
  end

  def send_chat_notification(user, booking_id, receiver)
    options = {
        priority: 'high',
        collapse_key: 'chat_message',
        data: { booking_id: booking_id},
        notification: {
            body: 'Tenes un nuevo mensaje de ' + user.first_name + " " + user.last_name,
            title: 'Nuevo mensaje',
            sound: 'default'
        }
    }
    fcm_client.send(receiver.firebase_token, options)
  end

  def fcm_client
    FCM.new("AAAAgIgUnn8:APA91bGu3L9vqrfv8CYdC_AZodVtJH0z4gBqAfThpBTedaH9FnX4Go3Www1EOYAktWS08iSx1-uKsxIcmNfPTkWsnQFKOJyGExSTNS9MTj3NCGe0n8jJsLvg3p5xzcPJ2MFTafNXvWm0")
  end
end
