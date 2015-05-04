class AddPartneridToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :partner_id, :string
  end
end
