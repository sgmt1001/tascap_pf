class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.text :content, null: false
      t.integer :task_id, null: false
       #コメントするタスクのID
      t.integer :user_id, null: false
       #コメントするユーザのID

      t.timestamps
    end
  end
end
