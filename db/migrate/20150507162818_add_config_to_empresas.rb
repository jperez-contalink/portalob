class AddConfigToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :filtromarca, :boolean
    add_column :empresas, :filtrocategoria, :boolean
  end
end
