require File.dirname(__FILE__) + '/../test_helper'
require 'contacts_controller'

# Re-raise errors caught by the controller.
class ContactsController; def rescue_action(e) raise e end; end

class ContactsControllerTest < Test::Unit::TestCase
  def setup
    @controller = ContactsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_contact
    assert_difference('Contact.count') do
      post :create, :contact => { }
    end

    assert_redirected_to contact_path(assigns(:contact))
  end

  def test_should_show_contact
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end

  def test_should_update_contact
    put :update, :id => 1, :contact => { }
    assert_redirected_to contact_path(assigns(:contact))
  end

  def test_should_destroy_contact
    assert_difference('Contact.count', -1) do
      delete :destroy, :id => 1
    end

    assert_redirected_to contacts_path
  end
end
