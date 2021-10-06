module InterestRepository
  extend self

  def my_index
    InterestRecord.includes(:account).order(percentage: :desc).all.map do |interest_data|
      Interest.new(interest_data.attributes_with_associations)
    end
  end

  def fetch(id)
    load_from_data(InterestRecord.includes(:account).find(id))
  end

  # This can be used to load the interest from the account
  def load_from_data(interest_data)
    Interest.new(interest_data.attributes_with_associations)
  end

  def save(interest)
    return false unless interest.valid?

    data = interest.id ? InterestRecord.find(interest.id) : InterestRecord.new

    data.assign_attributes(interest.attributes)
    data.save
  end

  def update(interest, params)
    interest.assign_attributes(params)

    return false unless interest.valid?

    data = InterestRecord.find(interest.id)
    data.update(params)
  end

  def destroy(interest)
    data = InterestRecord.find(interest.id)
    data.destroy
  end
end
