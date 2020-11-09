class Character < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      # attributes?
      # health_count, total_money, name, speed
      t.string :name
      t.integer :health_count
      t.integer :total_money
      t.integer :speed
    end
  end
end
