class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      t.integer :cep
      t.string :bairro
      t.string :cidade
      t.string :estado

      t.timestamps
    end
  end
end
