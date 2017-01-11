class CreateTakes < ActiveRecord::Migration
  def change
    create_table :takes do |t|
      t.boolean :online
      t.references :person, index: true

      t.timestamps null: false
    end
    add_foreign_key :takes, :people
  end
end
