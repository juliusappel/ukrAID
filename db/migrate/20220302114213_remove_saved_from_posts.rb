class RemoveSavedFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :saved, :boolean
  end
end
