class ChangeTitleToNameFromAddresses < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :title, :string
    add_column :addresses, :name, :string
  end
end
