class Createpost < ActiveRecord::Migration[6.0]
  def change
    create_table :posts  do |t|
      t.string :body
      t.string  :title
      t.integer :user_id      
    end
  end
end
