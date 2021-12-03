require 'factory_bot'

FactoryBot.define do
  factory :interest, class: Interest do
    to_create {}

    amount { 6 }
    rate { 5 }
    account_id { 5 }
    account { nil }

    after(:build) do |interest, _evaluator|
      interest.account_id = interest.account.id if interest.account
    end

    after(:create) do |interest, _evaluator|
      interest.account ||= Account.create!(iban: 'DE1284847')
      interest.account_id = interest.account.id
      data = InterestRecord.create!(interest.attributes)
      interest.id = data.id
      interest.created_at = data.created_at
      interest.updated_at = data.updated_at
    end
  end
end
