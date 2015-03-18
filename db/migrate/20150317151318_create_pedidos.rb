class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :usuario_id
      t.float :total
      t.float :subtotal
      t.boolean :abierto
      t.boolean :activo

      t.timestamps null: false
    end
  end
end
