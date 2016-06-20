class AddCnpjToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :cnpj, :string, null: false
  end
end
