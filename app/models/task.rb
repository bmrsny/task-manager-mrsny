class Task < ActiveRecord::Base
  belongs_to :list
  validates :title, presence: true
  validates :description, presence: true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.not_completed
    self.where(status: false)
  end
end
