class RenameFamilyNameToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :last_name, :last_name
  end
end
