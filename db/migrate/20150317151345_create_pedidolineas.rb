class CreatePedidolineas < ActiveRecord::Migration
  def change
    create_table :pedidolineas do |t|
      t.string :pedido_id
      t.string :producto
      t.string :product_value
      t.string :product_id
      t.float :precio
      t.float :cantidad
      t.float :total
      t.string :imagen

      t.timestamps null: false
    end
  end
end
