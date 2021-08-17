class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|

      t.string :name, null: false
      t.text :detail
      t.integer :man_hour, null: false
      t.time :deadline
      t.integer :status, null: false, default: 0
      t.integer :project_id, null: false
       #紐づくプロジェクトのID
      t.integer :user_id, null: false
       #タスクの担当ユーザID、初期は作成者になるようにコントローラで定義

      t.timestamps
    end
  end
end
