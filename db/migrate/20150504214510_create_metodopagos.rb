class CreateMetodopagos < ActiveRecord::Migration
  def change
    create_table :metodopagos do |t|

      t.timestamps null: false
    end
  end
end
