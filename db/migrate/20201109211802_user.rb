class User < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # attributes?
      # username
      t.string :username
    end
  end
end
