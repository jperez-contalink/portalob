class AddVendorToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :vendor_id, :string
  end
end
