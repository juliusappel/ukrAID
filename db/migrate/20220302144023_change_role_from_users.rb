class ChangeRoleFromUsers < ActiveRecord::Migration[6.1]
  def change
    # 0 = Normal user, 1 = Admin
    change_column :users, :role, :integer, default: 0
  end
end
