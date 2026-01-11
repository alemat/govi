json.extract! organization_unit, :id, :name, :custom_name, :short_name, :code, :ownership, :url, :latitude, :longitude, :phone, :email, :description, :visitable, :organization_type_id, :parent_organization_unit_id, :created_at, :updated_at
json.url organization_unit_url(organization_unit, format: :json)
