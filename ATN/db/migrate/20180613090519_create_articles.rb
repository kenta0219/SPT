class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :video
      t.string :user_name
      t.string :tag_name
      t.text :video_information


      t.timestamps
    end
  end
end
