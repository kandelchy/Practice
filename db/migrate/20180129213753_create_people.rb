class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.date :birth_date
      t.string :phone
      t.boolean :enable, default: true

      t.timestamps
    end
  end
end
