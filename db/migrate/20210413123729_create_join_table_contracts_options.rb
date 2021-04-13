class CreateJoinTableContractsOptions < ActiveRecord::Migration[6.0]
  create_table :contracts_options do |t|
    t.belongs_to :contract
    t.belongs_to :option
    t.timestamps
  end
end
