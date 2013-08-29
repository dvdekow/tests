class AddEfficiencyToAlgos < ActiveRecord::Migration
  def change
    add_column :algos, :efficiency, :float
  end
end
