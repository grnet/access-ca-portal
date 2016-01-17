class RaStaffMembership < ActiveRecord::Base

  belongs_to :member,
             class_name: 'Person',
             foreign_key: 'member_id'

  belongs_to :registration_authority,
             foreign_key: 'ra_id'

  validates :ra_id, presence: true
  validates :member_id, presence: true
  validates :role, presence: true

end
