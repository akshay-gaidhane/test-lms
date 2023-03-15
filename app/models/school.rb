class School < ApplicationRecord
  has_many :courses
  validates :name, :subdomain, presence: true
  validates :name, length: { minimum: 5 }, uniqueness: true

  def school_admin_email
    User.find(self.school_admin_id).email if self.school_admin_id
  end
end
