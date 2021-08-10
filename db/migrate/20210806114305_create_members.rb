class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|

    t.integer :user_id, null: false
      #プロジェクトに参加するユーザのID
     t.integer :spendable_hour, null: false
      #ユーザがプロジェクトに使える時間、キャパシティの計算に使用
      #man_hourの合計/spendable_hour=capasity(%)

      t.timestamps
    end
  end
end
