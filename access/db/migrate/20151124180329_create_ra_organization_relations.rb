class CreateRaOrganizationRelations < ActiveRecord::Migration
  def change
    create_table :ra_organization_relations do |t|
      t.integer :ra_id
      t.integer :organization_id
      t.timestamps null: false
    end
  end
end
