json.extract! partner, :id, :partner_type_id, :name, :short_name, :phone, :email, :country, :city, :district, :status, :description, :created_at, :updated_at
json.url partner_url(partner, format: :json)
