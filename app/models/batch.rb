class Batch < ApplicationRecord
  belongs_to :course
  has_many :enrollments

  validates_presence_of :start_time, :end_time, :name
  validates :name, length: { minimum: 5 }, uniqueness: true
  validate :end_time_is_after_start_time


  def self.enrolled_batches(user_id)
    batch_ids = Enrollment.where(sender_id: user_id).pluck(:batch_id)
    Batch.includes(:enrollments).where(id: batch_ids)
  end

  private
  	def end_time_is_after_start_time
	  return if end_time.blank? || start_time.blank?

	  if end_time <= start_time
	    errors.add(:end_time, "cannot be before the start time") 
	  end 
	end
end
