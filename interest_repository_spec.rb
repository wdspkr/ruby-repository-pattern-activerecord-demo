require './load'

RSpec.describe InterestRepository do
  it 'loads' do
    InterestRecord.create(amount: 2)
    puts InterestRepository.my_index
  end
end
