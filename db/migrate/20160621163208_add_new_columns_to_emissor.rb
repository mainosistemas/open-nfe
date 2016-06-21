class AddNewColumnsToEmissor < ActiveRecord::Migration[5.0]
  def change
    add_column :emissores, :tipo_de_pessoa_id, :integer, null: false, foreign_key: true
    add_column :emissores, :uf_id, :integer, null: false, foreign_key: true
    add_column :emissores, :municipio_id, :integer, null: false, foreign_key: true
  end
end
