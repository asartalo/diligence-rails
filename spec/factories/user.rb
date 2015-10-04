FactoryGirl.define do
  factory :user do
    name "Maria Makiling"
    email "maria_makiling@mailinator.com"
    password "secretpassword"

    initialize_with { User.where(email: email).first_or_create }
  end
end
