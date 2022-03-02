class AddSavedToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :saved, :boolean, default: false
  end
end
