class AddOrganizationIdToTemplates < ActiveRecord::Migration[5.2]
  def change
    add_reference :templates, :organization, index: true, foreign_key: true
  end
end
