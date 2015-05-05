class AddDefaultToListsCompletedColumn < ActiveRecord::Migration
  def up
    change_column_default :tasks, :status, false
  end

  def down
    change_column_default :tasks, :status, nil
  end
end
