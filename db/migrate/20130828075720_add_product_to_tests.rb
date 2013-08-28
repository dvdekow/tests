class AddProductToTests < ActiveRecord::Migration
  def change
    add_column :tests, :product, :string
  end
end
