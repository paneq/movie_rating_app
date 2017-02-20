require 'test_helper'

class MovieTest < ActiveSupport::TestCase
	test "invalid without a title" do
		m = Movie.new(title: nil)
		assert !m.valid?, "Title is not being validated"
	end

	test "invalid without a description" do
		m = Movie.new(title: "Rogue 1. Staw Wars", description: nil)
		assert !m.valid?, "Description is not being validated"
	end

  test "invalid without movie_length" do
    m = Movie.new(title: "Rogue 1. Staw Wars", 
                  description: "A history of rebel groups united in a daring mission to steal the imperial plans of the Death Star.",
                  movie_length: nil)
    assert !m.valid?, "Movie length is not being validated"
  end

  test "invalid without a category" do
    m = Movie.new(title: "Rogue 1. Star Wars", 
                  description: "A history of rebel groups united in a daring mission to steal the imperial plans of the Death Star.",
                  movie_length: 123, category_id: nil)
    #Rails 5 makes belongs_to association required by default
    #See http://blog.bigbinary.com/2016/02/15/rails-5-makes-belong-to-association-required-by-default.html
    assert !m.valid?, "A movie needs to belong to a category. Category is not being validated"
  end
    
  test "invalid without a director" do
    m = Movie.new(title: "Rogue 1. Staw Wars", 
                 description: "A history of rebel groups united in a daring mission to steal the imperial plans of the Death Star.",
                 movie_length: 123, category_id: 1, director: nil)
    assert !m.valid?, "Movie length is not being validated"
  end

  test "invalid without an image" do
    m = Movie.new(title: "Rogue 1. Staw Wars", 
                 description: "A history of rebel groups united in a daring mission to steal the imperial plans of the Death Star.",
                 movie_length: 123, category_id: 1, director: "Gareth Edwards", image: nil)
    assert !m.valid?, "Image is not being validated"
  end

  test "valid with valid attributes" do
    m = Movie.new(title: "Rogue 1. Staw Wars", 
                 description: "A history of rebel groups united in a daring mission to steal the imperial plans of the Death Star.",
                 movie_length: 123, category_id: 1, director: "Gareth Edwards", image: File.new(Rails.root + 'test/fixtures/Blade-runner.jpg'))
    assert true, m.valid?
  end
end
