class ContactShare < ActiveRecord::Base
  validates :contact_id, presence: true
  validates :user_id, presence: true
  validate :contact_id, uniqueness: { scope: :user_id }

  belongs_to :contact
  belongs_to :user
end
