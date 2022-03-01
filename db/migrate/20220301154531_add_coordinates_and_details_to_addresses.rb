class AddCoordinatesAndDetailsToAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :latitude, :float
    add_column :addresses, :longitude, :float
    add_column :addresses, :title, :string
  end
end
