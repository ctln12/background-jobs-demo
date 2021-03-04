class AddCreditToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :credit, :integer, default: 10, null: false
  end
end
