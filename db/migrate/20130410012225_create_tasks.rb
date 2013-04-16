class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.string :name
      t.date :due_date
      t.boolean :done

      t.timestamps
    end
  end
end
