class RemoveVoteScoreFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :vote_score, :integer
  end
end
