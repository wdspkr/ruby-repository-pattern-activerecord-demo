require './load_app'
require './spec/interest_factory'

RSpec.describe 'Interest with factory' do
  context 'without specifying the account' do
    it 'builds a valid interest' do
      interest = FactoryBot.build(:interest)

      expect(interest).to be_valid
      expect(InterestRepository.save(interest)).to be true
    end

    it 'creates a valid interest' do
      interest = FactoryBot.create(:interest)

      expect(interest).to be_valid
      expect(InterestRepository.fetch(interest.id)).to be_a(Interest)
    end
  end

  context 'with specifying the account' do
    let(:account) { Account.create!(iban: 'IT959384') }

    it 'builds a valid interest with the right account' do
      interest = FactoryBot.build(:interest, account: account)

      expect(interest).to be_valid
      expect(interest.account_id).to eq account.id
      expect(interest.account).to eq account
      expect(InterestRepository.save(interest)).to be true
    end

    it 'creates a valid interest with the right account' do
      interest = FactoryBot.create(:interest, account: account)

      expect(interest).to be_valid
      expect(interest.account_id).to eq account.id
      expect(interest.account).to eq account
      expect(InterestRepository.fetch(interest.id)).to be_a(Interest)
    end
  end
end
