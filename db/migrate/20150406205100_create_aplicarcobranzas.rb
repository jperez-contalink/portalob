class CreateAplicarcobranzas < ActiveRecord::Migration
  def change
    create_table :aplicarcobranzas do |t|

      t.timestamps null: false
    end
  end
end
