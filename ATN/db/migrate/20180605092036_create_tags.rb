class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
    	t.references :sports_name
   		t.timestamps
    end
  end
end
