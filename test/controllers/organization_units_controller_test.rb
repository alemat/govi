require "test_helper"

class OrganizationUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_unit = organization_units(:one)
  end

  test "should get index" do
    get organization_units_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_unit_url
    assert_response :success
  end

  test "should create organization_unit" do
    assert_difference("OrganizationUnit.count") do
      post organization_units_url, params: { organization_unit: { code: @organization_unit.code, custom_name: @organization_unit.custom_name, description: @organization_unit.description, email: @organization_unit.email, latitude: @organization_unit.latitude, longitude: @organization_unit.longitude, name: @organization_unit.name, organization_type_id: @organization_unit.organization_type_id, ownership: @organization_unit.ownership, parent_organization_unit_id: @organization_unit.parent_organization_unit_id, phone: @organization_unit.phone, short_name: @organization_unit.short_name, url: @organization_unit.url, visitable: @organization_unit.visitable } }
    end

    assert_redirected_to organization_unit_url(OrganizationUnit.last)
  end

  test "should show organization_unit" do
    get organization_unit_url(@organization_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_unit_url(@organization_unit)
    assert_response :success
  end

  test "should update organization_unit" do
    patch organization_unit_url(@organization_unit), params: { organization_unit: { code: @organization_unit.code, custom_name: @organization_unit.custom_name, description: @organization_unit.description, email: @organization_unit.email, latitude: @organization_unit.latitude, longitude: @organization_unit.longitude, name: @organization_unit.name, organization_type_id: @organization_unit.organization_type_id, ownership: @organization_unit.ownership, parent_organization_unit_id: @organization_unit.parent_organization_unit_id, phone: @organization_unit.phone, short_name: @organization_unit.short_name, url: @organization_unit.url, visitable: @organization_unit.visitable } }
    assert_redirected_to organization_unit_url(@organization_unit)
  end

  test "should destroy organization_unit" do
    assert_difference("OrganizationUnit.count", -1) do
      delete organization_unit_url(@organization_unit)
    end

    assert_redirected_to organization_units_url
  end
end
