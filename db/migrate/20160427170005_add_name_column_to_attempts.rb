class AddNameColumnToAttempts < ActiveRecord::Migration
  def change
    add_column :attempts, :name, :string
  end
end
