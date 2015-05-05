class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.boolean :status
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
