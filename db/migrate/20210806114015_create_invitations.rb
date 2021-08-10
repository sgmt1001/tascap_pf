class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|

      t.integer :organization_id, null: false
      t.integer :project_id, null: false
      t.integer :invitate_user_id, null: false
      t.integer :invitated_user_id, null: false

      t.timestamps
    end
  end
end
