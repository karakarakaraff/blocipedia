class AddStandardToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :standard, :boolean, default: true
  end
end
