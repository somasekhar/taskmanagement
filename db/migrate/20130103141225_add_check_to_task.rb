class AddCheckToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :check, :integer
  end
end
