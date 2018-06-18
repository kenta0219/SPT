class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :video
      t.references :user
      t.references :tag
      t.text :video_information


      t.timestamps
    end
  end
end
