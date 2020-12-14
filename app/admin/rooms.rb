ActiveAdmin.register Room do
	actions :all, except: [:destroy, :new]

	member_action :block, method: :put do
		resource.block!
		redirect_to collection_path, notice: "La publicación fue bloqueada"
	end

	member_action :unblock, method: :put do
		resource.unblock!
		redirect_to collection_path, notice: "La publicación fue desbloqueada"
	end

	action_item :block, only: :show, if: proc { !room.is_blocked? } do
		link_to "Bloquear", block_admin_room_path(resource), method: :put, class: "member_link" 
	end

	action_item :unblock, only: :show, if: proc { room.is_blocked? } do
		link_to "Desbloquear", unblock_admin_room_path(resource), method: :put, class: "member_link" 
	end

	filter :id

	permit_params :name, :description, :number_of_guests, :price_per_night, :latitude, :longitude, 
		:available_from, :available_to

	index do
		selectable_column
		id_column
		column :host do |room|
			room.host.user.name
		end
		column :name
		column :description
		column :number_of_guests
		column :price_per_night
		column :latitude
		column :longitude
		column :available_from
		column :available_to
		actions defaults: true do |room|
			item "Bloquear", block_admin_room_path(room), method: :put, class: "member_link" unless room.is_blocked?
			item "Desbloquear", unblock_admin_room_path(room), method: :put, class: "member_link" if room.is_blocked?
		end
	end

	form do |f|
		f.inputs do
			f.input :name
			f.input :description
			f.input :number_of_guests
			f.input :price_per_night
			f.input :latitude
			f.input :longitude
			f.input :available_from
			f.input :available_to
		end
		f.actions
	end

	show do |room|
		attributes_table do
			row :host do 
				room.host.user.name
			end
			row :name
			row :description
			row :number_of_guests
			row :price_per_night
			row :latitude
			row :longitude
			row :available_from
			row :available_to
		end
	end
end