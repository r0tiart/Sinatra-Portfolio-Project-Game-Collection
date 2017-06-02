class CreateGames < ActiveRecord::Migration[5.1]
  def change
  	create_table :games do |t|
  		t.string :title
  		t.string :publisher
  		t.string :genre
  	end
  end
end
