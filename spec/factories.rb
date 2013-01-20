FactoryGirl.define do
  factory :writer do
    first_name            "Akash"
    last_name							"Khandelwal"
    email                 "writer@example-1.com"
    password              "password"
    password_confirmation "password"
    screen_name           "sample screen"
    gender                "male"
  end

  factory :admin do
  	admin true
  end
end