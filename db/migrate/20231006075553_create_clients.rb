class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.datetime :time
      t.text :note

      t.timestamps
    end
  end
end
