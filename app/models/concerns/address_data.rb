module AddressData
  FIELDS = [:name, :phone, :street, :city, :postal_code, :country, :province]

  def to_address_data
    attributes.symbolize_keys.slice(*FIELDS)
  end

  def from_address_data(data)
    assign(data.symbolize_keys.slice(*FIELDS))
  end

  def update_address_data(data)
    update(data.symbolize_keys.slice(*FIELDS))
  end

  def assign_address_data(data)
    assign_attributes(data.symbolize_keys.slice(*FIELDS))
  end

  module ClassMethods
    def from_address_data(data)
      new(data.symbolize_keys.slice(*FIELDS))
    end
  end

  def self.included(base)
    base.extend ClassMethods
  end
end