# frozen_string_literal: true

module InterestRepo
  extend self

  def my_index
    InterestData.includes(:account).order(percentage: :desc).all.map do |interest_data|
      Interest.new(interest_data.attributes_with_associations)
    end
  end

  def fetch(id)
    load_from_data(InterestData.includes(:account).find(id))
  end

  # This can be used to load the interest from the account
  def load_from_data(interest_data)
    Interest.new(interest_data.attributes_with_associations)
  end

  def save(interest)
    return false unless interest.valid?

    data = interest.id ? InterestData.find(interest.id) : InterestData.new

    data.assign_attributes(interest.attributes)
    data.save
  end

  def update(interest, params)
    interest.assign_attributes(params)

    return false unless interest.valid?

    data = InterestData.find(interest.id)
    data.update(params)
  end

  def destroy(interest)
    data = InterestData.find(interest.id)
    data.destroy
  end
end
