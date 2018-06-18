class CreateVideoMergers < ActiveRecord::Migration[5.1]
  def change
    create_table :video_mergers do |t|
    	t.references :user
    	t.references :video
    	t.string :tag_name
    	t.timestamps
    end
  end
end
