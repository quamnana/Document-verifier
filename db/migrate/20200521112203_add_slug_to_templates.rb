class AddSlugToTemplates < ActiveRecord::Migration[5.2]
  def change
    add_column :templates, :slug, :string
    add_index :templates, :slug, unique: true
  end
end
