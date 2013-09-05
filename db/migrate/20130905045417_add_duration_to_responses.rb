class AddDurationToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :duration, :float
  end
end
