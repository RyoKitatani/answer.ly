class AddCountryStatueToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :country_code, :string, default:"JP"
  end
end
