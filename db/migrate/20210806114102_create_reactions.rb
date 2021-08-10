class CreateReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :reactions do |t|
      
      t.integer :user_id, null: false
        #リアクションするユーザのID
      t.integer :comment_id, null: false
        #リアクションされるコメントのID

      t.timestamps
    end
  end
end
