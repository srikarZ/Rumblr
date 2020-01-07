class Posts < ActiveRecord::Migration[6.0]
  def change
    create table :posts  do |t|
      t.string :post
  end
end
