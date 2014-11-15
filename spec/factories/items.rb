# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    recipe nil
    ingredient nil
    user nil
    amount "1"
    measure "piece"
  end
end
