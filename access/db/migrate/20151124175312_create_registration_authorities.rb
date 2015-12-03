class CreateRegistrationAuthorities < ActiveRecord::Migration
  def change
    create_table :registration_authorities do |t|
      t.string :description

      t.timestamps null: false

    end
  end
end
