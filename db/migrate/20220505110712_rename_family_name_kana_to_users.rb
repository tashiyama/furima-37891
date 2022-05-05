class RenameFamilyNameKanaToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :family_name_kana, :last_name_kana
  end
end
