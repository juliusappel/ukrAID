class RemoveContentFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :content, :text
  end
end
