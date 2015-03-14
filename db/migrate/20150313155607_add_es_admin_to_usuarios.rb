class AddEsAdminToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :isadmin, :boolean
  end
end
