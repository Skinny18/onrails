class CreatePsers < ActiveRecord::Migration[7.0]
  def change
    create_table :psers do |t|
      t.string :name
      t.string :email
      t.integer :senha

      t.timestamps
    end
  end
end
