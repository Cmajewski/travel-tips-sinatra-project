class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
        t.string :city
        t.string :country
     
    end
  end
end
