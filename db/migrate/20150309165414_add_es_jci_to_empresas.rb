class AddEsJciToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :es_jci, :string
  end
end
