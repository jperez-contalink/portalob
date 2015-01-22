class AddRfcToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :rfc, :string
  end
end
