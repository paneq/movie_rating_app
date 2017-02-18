class ChangeUnconfirmedEmailDataType < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
  		t.change :unconfirmed_email, :string
		end
  end
end
