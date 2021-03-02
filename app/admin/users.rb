ActiveAdmin.register User do
	actions :all, except: [:destroy, :new]

	member_action :block, method: :put do
		resource.block!
		redirect_to collection_path, notice: "El usuario fue bloqueado"
	end

	member_action :unblock, method: :put do
		resource.unblock!
		redirect_to collection_path, notice: "El usuario fue desbloqueado"
	end

	action_item :block, only: :show, if: proc { !user.is_blocked? } do
		link_to "Bloquear", block_admin_user_path(resource), method: :put, class: "member_link" 
	end

	action_item :unblock, only: :show, if: proc { user.is_blocked? } do
		link_to "Desbloquear", unblock_admin_user_path(resource), method: :put, class: "member_link" 
	end

	filter :id

	permit_params :first_name, :last_name, :email

	index do
		selectable_column
		id_column
		column :email
		column :first_name
		column :last_name
		column :created_at
		actions defaults: true do |user|
			item "Bloquear", block_admin_user_path(user), method: :put, class: "member_link" unless user.is_blocked?
			item "Desbloquear", unblock_admin_user_path(user), method: :put, class: "member_link" if user.is_blocked?
		end
	end

	show do |user|
		attributes_table do
			row :email
			row :first_name
			row :last_name
			row :firebase_id
			row :blocked_at
			row :firebase_token
			row :wallet do 
				user.wallet.address
			end
		end
	end
end
