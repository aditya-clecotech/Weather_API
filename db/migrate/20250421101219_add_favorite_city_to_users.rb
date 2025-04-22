class AddFavoriteCityToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :favorite_city, :string
  end
end
