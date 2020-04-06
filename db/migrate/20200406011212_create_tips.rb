class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :name
      t.string :type_of_place
      t.text :description
      t.integer :user_id
      t.integer :destination_id
    
    end
  end
end
