class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :dns
      t.string :rfc
      t.string :urlwebservice
      t.string :usuariosob
      t.string :passob

      t.timestamps null: false
    end
  end
end
