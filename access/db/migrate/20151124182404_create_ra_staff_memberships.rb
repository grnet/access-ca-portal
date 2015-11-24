class CreateRaStaffMemberships < ActiveRecord::Migration
  def change
    create_table :ra_staff_memberships do |t|
      t.integer :ra_id
      t.integer :member_id
      t.integer :role

      t.timestamps null: false
    end
  end
end
