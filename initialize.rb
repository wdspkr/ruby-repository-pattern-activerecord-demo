require_relative 'load'

ActiveRecord::Schema.define do
  create_table :interests do |table|
    table.integer :amount
    table.integer :rate
    table.integer :account_id
  end

  create_table :accounts do |table|
    table.string :iban
  end
end
