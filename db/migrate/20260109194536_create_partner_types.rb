class CreatePartnerTypes < ActiveRecord::Migration[8.1]
  def change
    create_table :partner_types, id: :uuid do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
