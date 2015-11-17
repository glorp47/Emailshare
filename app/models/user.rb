# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ActiveRecord::Base

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact

  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "ContactShare",
    dependent: :destroy

  has_many :contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "Contact",
    dependent: :destroy

  validates :username, presence: true
end
