class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|

    t.integer :project_id, null: false
    t.integer :user_id, null: false
    t.integer :spendable_hour, default: 0
      #ユーザがプロジェクトに使える時間、キャパシティの計算に使用
      #man_hourの合計/spendable_hour=capacity(%)

      t.timestamps
    end
  end
end
