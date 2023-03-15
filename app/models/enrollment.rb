class Enrollment < ApplicationRecord
  belongs_to :batch
  belongs_to :user
  enum status: { pending: 0, accepted: 1, rejected: 2 }, _default: :pending

  before_create :init

  
  scope :enrollment_list, -> (user) do
    if user.school_admin?
      where(monitored_by: user.id)
    else
      where(sender_id: user.id)
    end
  end

  def self.user_email(id)
    User.find(id).email
  end

  def init
    self.monitored_by ||= Batch.find(self.batch_id).user_id
  end
end
