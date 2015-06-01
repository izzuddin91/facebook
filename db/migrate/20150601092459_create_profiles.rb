class CreateProfiles < ActiveRecord::Migration
	def change
		create_table :profiles do |profile|
			profile.integer :user_id
			profile.integer :status_id
			profile.timestamps
		end
	end
end
