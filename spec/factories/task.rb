FactoryGirl.define do
  factory :task do
    name "Rake in the millions"
    user
  end

  factory :root_task do
    name "Granparent"
  end
end

