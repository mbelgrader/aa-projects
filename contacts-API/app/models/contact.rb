class Contact < ActiveRecord::Base
  validates :name, :email
  validate :email, uniqueness: { scope: :user_id }

  belongs_to :owners,
    foreign_key: :user_id,
    class_name: :User

  has_many :shared_users, through: :contact_shares, source: :user
  has_many :contact_shares
end
