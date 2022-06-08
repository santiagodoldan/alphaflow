class AddTodoActivityLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_activity_logs do |t|
      t.references :todo

      t.text :attribute_changes

      t.timestamps
    end
  end
end
