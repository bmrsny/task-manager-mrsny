class Task < ActiveRecord::Base
  belongs_to :list
  validates :title, presence: true
  validates :description, presence: true

  def self.not_completed
   self.where(status: false)
  end
end
