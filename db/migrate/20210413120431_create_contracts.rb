class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.integer :number, presence:true 
      t.string :status, default: 'pending'
      t.date :start_date, presence:true 
      t.date :end_date

      t.timestamps
    end
  end
end
