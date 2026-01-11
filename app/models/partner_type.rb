class PartnerType < ApplicationRecord
	has_many :partners

	validates :name, presence: true
end
