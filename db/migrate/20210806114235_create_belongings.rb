class CreateBelongings < ActiveRecord::Migration[5.2]
  def change
    create_table :belongings do |t|

      t.integer :organization_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
