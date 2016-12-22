require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name: "chicken parm", summary: "this is good shit bro",
              description: "just test bro dont jinx it")
  end
  
  test "recipe should be valid" do 
    assert @recipe.valid?
  end
  
end