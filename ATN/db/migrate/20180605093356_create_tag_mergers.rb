class CreateTagMergers < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_mergers do |t|
    	t.references :tag
    	t.references :video
    	t.timestamps
    end
  end
end
