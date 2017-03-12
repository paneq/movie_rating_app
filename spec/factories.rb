FactoryGirl.define do
  factory :user do
    email "test4@test.com"
    password "Password"
    confirmed_at Date.today
  end
end

FactoryGirl.define do
  factory :movie do
    category Category.first
    title "The Walking Dead"
    description "A group of survivors try to surive in the apocalyptic world overrun by zombies"
    director "Unknown"
    movie_length 45
    image File.open("#{Rails.root}/spec/support/The_Walking_Dead.jpg")
    association :user, factory: :user, strategy: :build
  end
end

FactoryGirl.define do
  factory :review do
    rating 10
    comment 'Great movie! Must see!'
  end
end