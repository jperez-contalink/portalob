class CreatePedidosobs < ActiveRecord::Migration
  def change
    create_table :pedidosobs do |t|

      t.timestamps null: false
    end
  end
end
