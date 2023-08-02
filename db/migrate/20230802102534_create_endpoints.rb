class CreateEndpoints < ActiveRecord::Migration[7.0]
  def change
    create_table :endpoints do |t|
      t.string :verb, null: false
      t.string :path, null: false
      t.json :response, null: false, default: {}

      t.timestamps
    end
  end
end
