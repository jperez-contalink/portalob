class CreateDocumentoscobranzas < ActiveRecord::Migration
  def change
    create_table :documentoscobranzas do |t|

      t.timestamps null: false
    end
  end
end
