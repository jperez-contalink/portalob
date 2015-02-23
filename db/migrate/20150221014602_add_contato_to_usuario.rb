class AddContatoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :title, :string
    add_column :usuarios, :correo, :string
  end
end
