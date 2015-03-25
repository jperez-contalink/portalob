class AddMaximoToPedidolinea < ActiveRecord::Migration
  def change
    add_column :pedidolineas, :maximo, :decimal
  end
end
