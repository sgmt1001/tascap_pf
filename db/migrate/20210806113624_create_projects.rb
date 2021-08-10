class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|

    t.string :name, null: false
    t.text :overview, null: false
    t.integer :user_id, null: false
        #組織の作成者が編集、更新、削除等を行えるようにするためのカラム

      t.timestamps
    end
  end
end
