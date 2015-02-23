class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.string :titulo
      t.string :correo
      t.integer :usuario_id

      t.timestamps null: false
    end
  end
end
