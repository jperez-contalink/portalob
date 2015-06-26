class AddAdimageidToPedidolinea < ActiveRecord::Migration
  def change
    add_column :pedidolineas, :adimageid, :string
  end
end
