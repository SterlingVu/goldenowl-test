# == Schema Information
#
# Table name: followings
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  following_id :bigint
#  user_id      :bigint
#
class Following < ApplicationRecord
  has_and_belongs_to_many :users
end
