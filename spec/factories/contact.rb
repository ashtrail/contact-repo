FactoryBot.define do
  factory :contact do
    name { 'John Doe' }
    category
    common_interests { [] }
    contact_groups { [] }
  end
end
