require './load_app'

RSpec.describe 'InterestRepository workflow' do
  it 'can CRUD the interest' do
    # Create the Interest and save it to the DB
    account = Account.create(iban: 'DE123')
    initial_interest = Interest.new(account_id: account.id, amount: 40_000, rate: 50)
    InterestRepository.save(initial_interest)

    # Load the interest by calling the index method on the repository
    load_interest_from_index = InterestRepository.my_index.first
    expect(load_interest_from_index.attributes).to eq(initial_interest.attributes)
    expect(load_interest_from_index.account.iban).to eq('DE123')

    # Fetch the interest by the id
    interest_id = load_interest_from_index.id
    load_interest_by_id = InterestRepository.fetch(interest_id)
    expect(load_interest_by_id.attributes).to eq(load_interest_from_index.attributes)

    # Update the interest
    InterestRepository.update(load_interest_by_id, rate: -24)
    load_the_updated_interest = InterestRepository.fetch(interest_id)
    expect(load_the_updated_interest.rate).to eq(-24)

    # Load the interest from the account
    expect(account.interest.attributes).to eq(load_the_updated_interest.attributes)

    # Destroy the interest
    InterestRepository.destroy(load_the_updated_interest)
    expect(InterestRepository.my_index).to eq([])
  end
end
