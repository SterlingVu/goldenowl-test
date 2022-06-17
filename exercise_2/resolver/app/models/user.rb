# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           default(""), not null
#  username   :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_and_belongs_to_many :followings
  has_and_belongs_to_many :followers

  validates :username, presence: true

  # Caused by NameError: uninitialized constant User::EmailValidator
  # validates :email, presence: true, email: true, uniqueness: true
end
