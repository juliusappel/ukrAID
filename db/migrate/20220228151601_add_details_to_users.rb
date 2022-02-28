class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string

    # 0 = Normal user, 1 = Admin
    add_column :users, :role, :integer
  end
end
