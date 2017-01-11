class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :vk
      t.string :name

      t.timestamps null: false
    end
  end
end
