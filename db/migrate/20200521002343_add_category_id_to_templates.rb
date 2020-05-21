class AddCategoryIdToTemplates < ActiveRecord::Migration[5.2]
  def change
    add_reference :templates, :category, index: true, foreign_key: true
  end
end
