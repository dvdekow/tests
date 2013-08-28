class CreateAlgos < ActiveRecord::Migration
  def change
    create_table :algos do |t|
      t.integer :product_view
      t.integer :recommendation_clicked
      t.integer :recommendation_bought

      t.timestamps
    end
  end
end
