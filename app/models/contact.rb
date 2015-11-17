# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contact < ActiveRecord::Base

  has_many :contact_shares,
  dependent: :destroy

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"

  validates :name, presence: true
  validates :email, presence: true
  validates :user_id, presence: true, uniqueness: {scope: :email}
  # validate :unique_name_email_pair

private
  def unique_name_email_pair
    if Contact.find_by(email: email, user_id: user_id)
      errors[:base] << "Name and email pair already exist"
    end
  end
end
