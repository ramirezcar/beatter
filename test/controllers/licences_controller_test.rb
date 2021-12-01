require "test_helper"

class LicencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @licence = licences(:one)
  end

  test "should get index" do
    get licences_url
    assert_response :success
  end

  test "should get new" do
    get new_licence_url
    assert_response :success
  end

  test "should create licence" do
    assert_difference('Licence.count') do
      post licences_url, params: { licence: { file_url: @licence.file_url, price: @licence.price } }
    end

    assert_redirected_to licence_url(Licence.last)
  end

  test "should show licence" do
    get licence_url(@licence)
    assert_response :success
  end

  test "should get edit" do
    get edit_licence_url(@licence)
    assert_response :success
  end

  test "should update licence" do
    patch licence_url(@licence), params: { licence: { file_url: @licence.file_url, price: @licence.price } }
    assert_redirected_to licence_url(@licence)
  end

  test "should destroy licence" do
    assert_difference('Licence.count', -1) do
      delete licence_url(@licence)
    end

    assert_redirected_to licences_url
  end
end
