class AddParentIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :parent_id, :integer
    add_column :tasks, :sort_order, :integer
  end
end
