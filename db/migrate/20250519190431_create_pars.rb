class CreatePars < ActiveRecord::Migration[7.1]
  def change
    create_table :pars do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
