class AddCustnameToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :customer_name, :string
  end
end
