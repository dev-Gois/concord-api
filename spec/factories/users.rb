FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'johndoe@johndoe.com' }
    password { 'password' }
  end
end
