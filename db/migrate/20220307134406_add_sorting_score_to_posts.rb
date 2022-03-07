class AddSortingScoreToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :sorting_score, :float
  end
end
