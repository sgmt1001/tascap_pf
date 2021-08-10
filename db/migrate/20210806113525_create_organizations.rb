class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|

      t.string :name, null: false
      t.string :introduction
      t.integer :user_id, null: false
        #組織の作成者が編集、更新、削除等を行えるようにするためのカラム、organizationのownerに

      t.timestamps
    end
  end
end
