class AddEmpresaIdToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :empresa_id, :integer
    add_index :usuarios, :empresa_id
  end
end
