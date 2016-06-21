class CreateTiposDePessoas < ActiveRecord::Migration[5.0]
  def change
    create_table :tipos_de_pessoas do |t|
      t.string :codigo, null: false
      t.string :nome_por_extenso, null: false
      t.timestamps
    end
  end
end
