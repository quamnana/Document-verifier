class AddUserIdToTemplates < ActiveRecord::Migration[5.2]
  def change
    add_reference :templates, :user, index: true, foreign_key: true
  end
end
