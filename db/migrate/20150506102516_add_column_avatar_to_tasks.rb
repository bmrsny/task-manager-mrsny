class AddColumnAvatarToTasks < ActiveRecord::Migration
  def self.up
    add_attachment :tasks, :avatar
  end

  def self.down
    remove_attachment :tasks, :avatar
  end
end
