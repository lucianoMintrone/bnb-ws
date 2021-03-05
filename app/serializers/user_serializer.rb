# == Schema Information
#
# Table name: users
#
#  id             :bigint           not null, primary key
#  blocked_at     :datetime
#  email          :string
#  firebase_token :string
#  first_name     :string
#  last_name      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  firebase_id    :string           default(""), not null
#
# Indexes
#
#  index_users_on_firebase_id  (firebase_id) UNIQUE
#
class UserSerializer < ActiveModel::Serializer
	attributes :id, :email, :first_name, :last_name

	has_one :guest
	has_one :host
	has_one :image_url
end
