class CreateRegistrationAuthorityTranslations < ActiveRecord::Migration
  def up
    RegistrationAuthority.create_translation_table!({
                                               description: :text,
                                           },
                                           {
                                               migration_data: true
                                           })
  end

  def down
    RegistrationAuthority.drop_translation_table! migrate_data: true
  end
end
