class CreatePaises < ActiveRecord::Migration[5.0]
  def change
    create_table :paises do |t|
      t.string :nome, null: false
      t.integer :codigo_ibge, null: false
      t.string :codigo_siscomex, null: false
      t.timestamps
    end
  end
end
