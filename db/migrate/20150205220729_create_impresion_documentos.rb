class CreateImpresionDocumentos < ActiveRecord::Migration
  def change
    create_table :impresion_documentos do |t|

      t.timestamps null: false
    end
  end
end
