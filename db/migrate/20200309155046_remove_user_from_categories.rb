class RemoveUserFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference :categories, :user, foreign_key: true
  end
end
