require_relative '../views/view'
require_relative '../models/customer'

class CustomersController
  def initialize(customers_repository)
    @customers_repository = customers_repository
    @view = View.new
  end

  def add
    # demander un nom
    name = @view.ask_for('name')
    # demander un address
    address = @view.ask_for('address')
    # instancier un plat
    customer = Customer.new(name: name, address: address)
    # save
    @customers_repository.create(customer)
  end

  def list
    # recuperer les plats
    customers = @customers_repository.all
    # les donner a afficher
    @view.display_customers(customers)
  end
end
