class CreateMunicipios < ActiveRecord::Migration[5.0]
  def change
    create_table :municipios do |t|
      t.string :nome, null: false
      t.integer :codigo_ibge, null: false
      t.boolean :capital, null: false, default: false
      t.integer :uf_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
