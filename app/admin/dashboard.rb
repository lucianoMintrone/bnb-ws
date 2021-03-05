ActiveAdmin.register_page "Dashboard" do
	content do
		panel "Usuarios con reservas" do
			column_chart Booking.joins(guest: :user).group(:email).order(count: :desc).count
		end
	end
end
