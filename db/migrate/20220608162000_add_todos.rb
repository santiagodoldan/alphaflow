class AddTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.text :title
      t.text :description
      t.integer :status

      t.timestamps
    end
  end
end
