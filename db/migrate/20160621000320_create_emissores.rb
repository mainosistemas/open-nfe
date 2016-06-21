class CreateEmissores < ActiveRecord::Migration[5.0]
  def change
    create_table :emissores do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :nome_fantasia
      t.string :razao_social
      t.string :inscricao_estadual
      t.string :inscricao_municipal
      t.string :cep
      t.string :logradouro
      t.string :numero_do_endereco
      t.string :complemento
      t.string :bairro
      t.timestamps
    end
  end
end
