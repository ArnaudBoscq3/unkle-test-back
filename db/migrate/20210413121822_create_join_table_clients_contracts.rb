class CreateJoinTableClientsContracts < ActiveRecord::Migration[6.0]
  create_table :clients_contracts do |t|
    t.belongs_to :client
    t.belongs_to :contract
    t.timestamps
  end
end
