require 'test_helper'

class RaStaffMembershipTest < ActiveSupport::TestCase

  def valid_params
    {
        ra_id: 1,
        member_id: 1,
        role: 'ra.role'
    }
  end

  def test_valid_record
    normal_org = RaStaffMembership.new(valid_params)
    assert normal_org.valid?, "Can't create with valid params: #{normal_org.errors.messages}"
  end

  def test_org_without_compulsory_field
    compulsory_fields = [:ra_id, :member_id, :role]
    compulsory_fields.each do |f|
      invalid_params = valid_params.clone
      invalid_params.delete f
      invalid_org = RaStaffMembership.new(invalid_params)
      refute invalid_org.valid?, "Can't be valid without #{f}"
    end
  end

end
