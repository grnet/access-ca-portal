class RegistrationAuthority < ActiveRecord::Base

  has_many :ra_staff_memberships,
           foreign_key: 'ra_id'


  has_and_belongs_to_many :organizations,
                          join_table: 'ra_organization_relations',
                          foreign_key: 'ra_id',
                          association_foreign_key: 'organization_id'

  belongs_to :organization

  validates :description, presence: true

end
