class AddPrecioobToPedidolinea < ActiveRecord::Migration
  def change
    add_column :pedidolineas, :precioob, :float
  end
end
