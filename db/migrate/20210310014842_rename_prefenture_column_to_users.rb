class RenamePrefentureColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :prefenture_code, :prefecture_code
  end
end
