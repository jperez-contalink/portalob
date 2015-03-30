class AddExtrasToPedidolinea < ActiveRecord::Migration
  def change
    add_column :pedidolineas, :precioproductoextra, :float
    add_column :pedidolineas, :productoextra, :string
  end
end
