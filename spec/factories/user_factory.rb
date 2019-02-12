FactoryBot.define do
  sequence(:email) {|n| "users#{n}@example.com"}

  factory :user, class: User do
    email
    password { "password" }
    first_name { "Bob" }
    last_name { "Ross" }
    admin false
  end

  factory :admin, class: User do
    email
    password { "boom" }
    admin true
    first_name { "Paul" }
    last_name {"Bunyan"} 

  end
end
