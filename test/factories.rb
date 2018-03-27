FactoryBot.define do
  factory :transaction do
    association :user
    association :teacher
    shopping_date Date.current
    date_entered Date.current
    uploaded false
  end

  factory :transaction_item do
    quantity 5
  end

  #following factories used for purpose of testing transaction and transaction_items

  factory :user do
    username "admin"
    password_digest "password"
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
  end

  factory :school do
    name "Carnegie Mellon University"
  end

  factory :item do
    name "Pencils"
    max_packs 8
    qty_per_unit 10
    active true
  end
end