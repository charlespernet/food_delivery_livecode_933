require_relative '../models/customer'
require_relative './base_repository'

class CustomerRepository < BaseRepository
  def build_element(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end

  def build_headers
    %w[id name address]
  end
end