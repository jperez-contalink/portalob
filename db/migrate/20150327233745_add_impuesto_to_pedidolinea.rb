class AddImpuestoToPedidolinea < ActiveRecord::Migration
  def change
    add_column :pedidolineas, :impuesto, :float
  end
end
