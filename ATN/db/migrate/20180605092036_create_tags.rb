class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
    	t.string :sports_name
   		t.timestamps
    end
  end
end
