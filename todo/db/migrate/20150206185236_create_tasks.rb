class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :complete
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
