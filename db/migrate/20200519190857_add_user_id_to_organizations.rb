class AddUserIdToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :user_id, :integer
  end
end
