class CreateStops < ActiveRecord::Migration[7.1]
  def change
    create_table :stops do |t|
      t.string :name

      t.timestamps
    end
  end
end
