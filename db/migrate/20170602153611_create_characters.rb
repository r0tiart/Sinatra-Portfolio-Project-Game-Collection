class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
  	create_table :characters do |t|
  		t.string :name
  		t.integer :level
  		t.string :klass
  		t.integer :user_id
  		t.integer :game_id
  	end
  end
end
