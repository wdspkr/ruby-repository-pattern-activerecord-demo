# frozen_string_literal: true

class Interest
  include ActiveModel::Model

  ATTRIBUTES_FOR_DATA = %i[account_id amount rate].freeze

  attr_accessor(*ATTRIBUTES_FOR_DATA, :account, :id, :created_at, :updated_at)

  validates :account_id, :amount, :rate, presence: true

  def attributes
    ATTRIBUTES_FOR_DATA.index_with do |attribute|
      send(attribute)
    end
  end
end
