require "test_helper"

class PartnerTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partner_type = partner_types(:one)
  end

  test "should get index" do
    get partner_types_url
    assert_response :success
  end

  test "should get new" do
    get new_partner_type_url
    assert_response :success
  end

  test "should create partner_type" do
    assert_difference("PartnerType.count") do
      post partner_types_url, params: { partner_type: { description: @partner_type.description, name: @partner_type.name } }
    end

    assert_redirected_to partner_type_url(PartnerType.last)
  end

  test "should show partner_type" do
    get partner_type_url(@partner_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_partner_type_url(@partner_type)
    assert_response :success
  end

  test "should update partner_type" do
    patch partner_type_url(@partner_type), params: { partner_type: { description: @partner_type.description, name: @partner_type.name } }
    assert_redirected_to partner_type_url(@partner_type)
  end

  test "should destroy partner_type" do
    assert_difference("PartnerType.count", -1) do
      delete partner_type_url(@partner_type)
    end

    assert_redirected_to partner_types_url
  end
end
