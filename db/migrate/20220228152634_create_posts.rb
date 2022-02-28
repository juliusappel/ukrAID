class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.string :location
      t.string :phone_number
      t.string :email
      t.string :website
      t.integer :vote_score
      t.boolean :pending

      t.timestamps
    end
  end
end
