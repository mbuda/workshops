# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    firstname 'John'
    lastname 'Doe'
    email 'test@test.com'
    password 'password123'
    admin 'false'
  end

  factory :admin, class: 'User' do
    firstname 'First'
    lastname 'Last'
    email 'admin@i.am'
    password '12345678'
    admin 'true'
  end
end
