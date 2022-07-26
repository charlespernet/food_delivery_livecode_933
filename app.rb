require_relative 'router'
require_relative 'app/controllers/meals_controller'

meals_csv = File.join(__dir__, 'data/meals.csv')
customers_csv = File.join(__dir__, 'data/customers.csv')
meal_repository = MealRepository.new(meals_csv)
customer_repository = CustomerRepository.new(customers_csv)
meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)
router = Router.new(meals_controller, customers_controller)

router.run
