class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.timestamps null: false
      t.datetime :done_at
    end
    add_reference :tasks, :user, index: true
    add_foreign_key :tasks, :users
  end
end
