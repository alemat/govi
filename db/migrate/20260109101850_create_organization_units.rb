class CreateOrganizationUnits < ActiveRecord::Migration[8.1]
  def change
    create_table :organization_units, id: :uuid do |t|
      t.string :name
      t.string :custom_name
      t.string :short_name
      t.string :code
      t.string :ownership
      t.string :url
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.string :email
      t.text :description
      t.boolean :visitable
      t.references :organization_type, null: false, foreign_key: true, type: :uuid
      t.references :parent_organization_unit, type: :uuid, foreign_key: { to_table: :organization_units }, index: true

      t.timestamps
    end
  end
end
