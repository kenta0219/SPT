class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
    	t.string :video_name
    	t.text :video_information
    	t.text :video_id
    	t.string :user_id
 	    t.timestamps
    end
  end
end
