ActiveRecord::Schema.define do
  create_table :interests do |table|
    table.integer  :amount
    table.integer  :rate
    table.integer  :account_id
    table.datetime :created_at
    table.datetime :updated_at
  end

  create_table :accounts do |table|
    table.string :iban
  end
end
