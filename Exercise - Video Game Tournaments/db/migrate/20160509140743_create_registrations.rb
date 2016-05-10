class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
    	t.integer :tournament_id, index: true
    	t.integer :player_id, index: true
    	
      t.timestamps null: false
    end
  end
end
