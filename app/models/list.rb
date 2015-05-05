class List < ActiveRecord::Base
  has_many :tasks
  validates :title, presence: true

  def self.not_archived
    self.where(archived: false)
  end
end
