class CreateUfs < ActiveRecord::Migration[5.0]
  def change
    create_table :ufs do |t|
      t.integer :codigo_ibge, null: false
      t.string :nome, null: false
      t.string :nome_por_extenso, null: false

      t.timestamps
    end
  end
end
