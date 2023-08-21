class CreateUsers < ActiveRecord::Migration[7.0]
  def down
    drop_table :users
  end

  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :senha

      t.timestamps
    end
  end

 
end
