class AddNombreToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :nombre, :string
  end
end
