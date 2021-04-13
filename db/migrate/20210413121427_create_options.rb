class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string :title, presence:true 
      t.text :description

      t.timestamps
    end
  end
end
