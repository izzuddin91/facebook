class CreateStatuses < ActiveRecord::Migration
  def change 
  	create_table :statuses do |status|
  		status.string :news
  		status.timestamps
  	end
  end
end
