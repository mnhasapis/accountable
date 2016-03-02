class Goal < ActiveRecord::Base
	validates :description, presence: true

  belongs_to :user
  has_many :comments

  def completed?
        !completed_at.blank?
  end
end
