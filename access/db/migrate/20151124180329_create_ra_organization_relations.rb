class CreateRaOrganizationRelations < ActiveRecord::Migration
  def change
    create_table :ra_organization_relations do |t|
      t.belongs_to :registration_authority, foreign_key: :ra_id
      t.belongs_to :organization, foreign_key: :organization_id
      t.timestamps null: false
    end
  end
end
