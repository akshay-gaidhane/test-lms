class Course < ApplicationRecord
  belongs_to :school
  has_many :batches, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }, uniqueness: true

  
  def self.student_courses(user_id)
  	course_ids = Enrollment.includes(:batch).where(sender_id: user_id).pluck(:course_id)
  	Course.where(id: course_ids.uniq)
  end
end
