require 'test_helper'

class RegistrationAuthorityTest < ActiveSupport::TestCase

  def valid_params
    {
        description: 'ra_description'
    }
  end

  def test_valid_record
    normal_org = RegistrationAuthority.new(valid_params)
    assert normal_org.valid?, "Can't create with valid params: #{normal_org.errors.messages}"
  end

  def test_org_without_compulsory_field
    compulsory_fields = [:description]
    compulsory_fields.each do |f|
      invalid_params = valid_params.clone
      invalid_params.delete f
      invalid_org = RegistrationAuthority.new(invalid_params)
      refute invalid_org.valid?, "Can't be valid without #{f}"
    end
  end

end
