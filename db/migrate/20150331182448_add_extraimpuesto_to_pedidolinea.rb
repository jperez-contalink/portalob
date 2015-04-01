class AddExtraimpuestoToPedidolinea < ActiveRecord::Migration
  def change
    add_column :pedidolineas, :impuestoextra, :float
  end
end
