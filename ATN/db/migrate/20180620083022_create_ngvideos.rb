class CreateNgvideos < ActiveRecord::Migration[5.1]
  def change
    create_table :ngvideos do |t|

      t.timestamps
    end
  end
end
