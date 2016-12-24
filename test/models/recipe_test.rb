require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @recipe = Recipe.new(name: "chicken parm", summary: "this is good shit bro",
              description: "this is a testing description")
  end
  
  test "recipe should be valid" do 
    assert @recipe.valid?
  end
  
  test "name should be valid" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    
  end
  
  test "name length should not be too short" do
    
  end
  
  test "summary should be present" do
    
  end
  
  test "summary length should not be too long" do
    
  end
  
  test "summary length should not be too short" do
    
  end
  
  test "description should be present" do
    
  end
  
  test "description should be too long" do
    
  end
  
  test "description should be too short" do
    
  end
end