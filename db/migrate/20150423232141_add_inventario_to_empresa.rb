class AddInventarioToEmpresa < ActiveRecord::Migration
  def change
    add_column :empresas, :inventario, :boolean
  end
end
