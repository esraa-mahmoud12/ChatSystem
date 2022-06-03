class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :token, limit: 24
      t.string :name
      t.integer :chat_count, default: 0
      t.index :token, unique: true

      t.timestamps
    end
   
    
  end
end
