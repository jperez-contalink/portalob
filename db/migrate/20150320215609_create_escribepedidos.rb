class CreateEscribepedidos < ActiveRecord::Migration
  def change
    create_table :escribepedidos do |t|

      t.timestamps null: false
    end
  end
end
