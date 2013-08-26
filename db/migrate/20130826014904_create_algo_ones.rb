class CreateAlgoOnes < ActiveRecord::Migration
  def change
    create_table :algo_ones do |t|
      t.integer :total_view
      t.integer :total_click
      t.integer :total_buy

      t.timestamps
    end
  end
end
