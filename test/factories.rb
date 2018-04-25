FactoryBot.define do
  factory :order do
    association :user
    association :teacher
    shopping_date Date.current
    date_entered Date.current
    uploaded false
  end

  factory :order_item do
    association :order
    association :item
    quantity 5
  end

  #following factories used for purpose of testing order and order_items

  factory :user do
    username "admin"
    password "password"
    password_confirmation "password"
    first_name "Catherine"
    last_name "Price"
    email "cat@theeducationpartnership.org"
    role "Administrator"
    active true
  end

  factory :teacher do
    association :school
    first_name "Amy"
    last_name "Lin"
    email "amylin@gmail.com"
    phone "2158039888"
  end

  factory :school do
    name "Carnegie Mellon University"
    phone "2676407466"
  end

  factory :item do
    name "Pencils"
    max_packs 8
    qty_per_unit 10
    active true
  end

end