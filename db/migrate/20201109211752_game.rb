class Game < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      # attributes?
      # user_id, character_id, health_count, total_money
      t.integer :user_id
      t.integer :character_id
      t.integer :health_count
      t.integer :total_money 
    end
  end
end
