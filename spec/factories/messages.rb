FactoryBot.define do
  factory :message do
    sender { nil }
    thread { nil }
    content { "MyString" }
  end
end
