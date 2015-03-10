class CreatePrecios < ActiveRecord::Migration
  def change
    create_table :precios do |t|

      t.timestamps null: false
    end
  end
end
