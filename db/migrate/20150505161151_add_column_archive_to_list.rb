class AddColumnArchiveToList < ActiveRecord::Migration
  def change
    add_column :lists, :archived, :boolean, default: false
  end
end
