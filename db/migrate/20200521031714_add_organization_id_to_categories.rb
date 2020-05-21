class AddOrganizationIdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :organization, foreign_key: true
  end
end
