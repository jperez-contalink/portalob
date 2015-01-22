class AddRfcempresaToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :rfcempresa, :string
  end
end
