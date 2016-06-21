class CreateClientes < ActiveRecord::Migration[5.0]
  def change
    create_table :clientes do |t|
      t.integer :tipo_de_pessoa_id, null: false, foreign_key: true
      t.string :numero_do_documento, null: false
      t.string :inscricao_estadual
      t.string :inscricao_municipal
      t.string :razao_social, null: false
      t.string :nome_fantasia
      t.string :cep, null: false
      t.string :endereco, null: false
      t.string :numero
      t.string :complemento
      t.string :bairro, null: false
      t.integer :pais_id, null: false, foreign_key: true
      t.integer :uf_id, null: false, foreign_key: true
      t.integer :municipio_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
