require 'test_helper'

class MovieTest < ActiveSupport::TestCase
	test "invalid without title" do
		m = Movie.new
		assert !m.valid?, "Name is not being validated"
	end

	test "invalid without description" do
		m = Movie.new
		assert !m.valid?, "Name is not being validated"
	end
end
