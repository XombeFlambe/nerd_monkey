class AddDueDate < ActiveRecord::Migration
  def change
    add_column :notes, :due_on, :date
  end
end
