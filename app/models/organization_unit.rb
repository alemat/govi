class OrganizationUnit < ApplicationRecord
  belongs_to :organization_type
  belongs_to :parent_organization_unit
end
