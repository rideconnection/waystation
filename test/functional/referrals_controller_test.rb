require 'test_helper'

class ReferralsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Referral.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Referral.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Referral.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to referral_url(assigns(:referral))
  end

  def test_edit
    get :edit, :id => Referral.first
    assert_template 'edit'
  end

  def test_update_invalid
    Referral.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Referral.first
    assert_template 'edit'
  end

  def test_update_valid
    Referral.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Referral.first
    assert_redirected_to referral_url(assigns(:referral))
  end

  def test_destroy
    referral = Referral.first
    delete :destroy, :id => referral
    assert_redirected_to referrals_url
    assert !Referral.exists?(referral.id)
  end
end
