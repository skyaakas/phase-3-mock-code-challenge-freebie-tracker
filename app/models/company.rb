class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebies(dev, item_name, value)
        Freebie.create(item_name: item_name, value: value, devs_id: self.devs.id, companies_id: self.id)
    end

    def self.oldest_company
        self.all.order(:founding_year).first
    end
end
