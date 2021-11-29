class Account < ActiveRecord::Base
  has_one :interest_record

  def interest
    interest_record && InterestRepository.load_from_data(interest_record)
  end
end
