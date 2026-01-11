class CreatePartners < ActiveRecord::Migration[8.1]
  def change
    create_table :partners, id: :uuid do |t|
      t.references :partner_type, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :short_name
      t.string :phone
      t.string :email
      t.string :country
      t.string :city
      t.string :district
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
