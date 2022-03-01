class RemoveLocationFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :location, :string
  end
end
