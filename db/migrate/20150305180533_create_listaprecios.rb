class CreateListaprecios < ActiveRecord::Migration
  def change
    create_table :listaprecios do |t|

      t.timestamps null: false
    end
  end
end
