class AddForeignKeyTasks < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tasks, :users, column: :user_id, on_update: :cascade, on_delete: :cascade
  end
end
