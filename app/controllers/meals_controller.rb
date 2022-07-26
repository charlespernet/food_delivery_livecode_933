require_relative '../views/view'
require_relative '../models/meal'

class MealsController
  def initialize(meals_repository)
    @meals_repository = meals_repository
    @view = View.new
  end

  def add
    # demander un nom
    name = @view.ask_for('name')
    # demander un price
    price = @view.ask_for('price').to_i
    # instancier un plat
    meal = Meal.new(name: name, price: price)
    # save
    @meals_repository.create(meal)
  end

  def list
    # recuperer les plats
    meals = @meals_repository.all
    # les donner a afficher
    @view.display_meals(meals)
  end
end
