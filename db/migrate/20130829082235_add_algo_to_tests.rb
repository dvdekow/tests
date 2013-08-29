class AddAlgoToTests < ActiveRecord::Migration
  def change
    add_column :tests, :algo, :string
  end
end
