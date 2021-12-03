require 'factory_bot'

FactoryBot.define do
  factory :interest, class: Interest do
    to_create {} # this will prevent factory bot from trying to call .save on the Interest

    amount { 6 }
    rate { 5 }
    account_id { 5 }
    account { nil }

    after(:build) do |interest, _evaluator|
      interest.account_id = interest.account.id if interest.account # this is making the association consistent
    end

    after(:create) do |interest, _evaluator|
      interest.account ||= Account.create!(iban: 'DE1284847') # let's create one account if we don't have it yet
      interest.account_id = interest.account.id
      data = InterestRecord.create!(interest.attributes) # this will persist the data to the DB
      interest.id = data.id                   #
      interest.created_at = data.created_at   # pass the DB generated attributes to the model
      interest.updated_at = data.updated_at   #
    end
  end
end
