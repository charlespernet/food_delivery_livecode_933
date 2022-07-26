require_relative 'router'
require_relative 'app/controllers/meals_controller'

meals_csv = File.join(__dir__, 'data/meals.csv')
meals_repository = MealRepository.new(meals_csv)
meals_controller = MealsController.new(meals_repository)
customers_controller = 
router = Router.new(meals_controller, customers_controller)

router.run