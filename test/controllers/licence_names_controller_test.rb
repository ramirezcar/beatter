require "test_helper"

class LicenceNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @licence_name = licence_names(:one)
  end

  test "should get index" do
    get licence_names_url
    assert_response :success
  end

  test "should get new" do
    get new_licence_name_url
    assert_response :success
  end

  test "should create licence_name" do
    assert_difference('LicenceName.count') do
      post licence_names_url, params: { licence_name: { name: @licence_name.name } }
    end

    assert_redirected_to licence_name_url(LicenceName.last)
  end

  test "should show licence_name" do
    get licence_name_url(@licence_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_licence_name_url(@licence_name)
    assert_response :success
  end

  test "should update licence_name" do
    patch licence_name_url(@licence_name), params: { licence_name: { name: @licence_name.name } }
    assert_redirected_to licence_name_url(@licence_name)
  end

  test "should destroy licence_name" do
    assert_difference('LicenceName.count', -1) do
      delete licence_name_url(@licence_name)
    end

    assert_redirected_to licence_names_url
  end
end
