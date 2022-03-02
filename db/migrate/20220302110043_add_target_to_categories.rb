class AddTargetToCategories < ActiveRecord::Migration[6.1]
  def change
    # 0 = Both, 1 = Ukrainian, 2 = Rest of the world
    add_column :categories, :target_group, :integer
  end
end
