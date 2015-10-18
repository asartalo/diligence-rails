class AddArchivedColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :archived, :boolean, null: false, default: false
  end
end
