class AddTaskableIdAndTaskableTypeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :taskable_id, :integer
    add_column :tasks, :taskable_type, :string
  end
end
