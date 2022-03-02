class RemoveTargetFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :target, :integer
  end
end
