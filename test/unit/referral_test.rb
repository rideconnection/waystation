require 'test_helper'

class ReferralTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Referral.new.valid?
  end
end
