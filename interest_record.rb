# frozen_string_literal: true

class InterestRecord < ActiveRecord::Base
  self.table_name = 'interests'

  belongs_to :account

  def attributes_with_associations
    attributes.merge('account' => account)
  end
end