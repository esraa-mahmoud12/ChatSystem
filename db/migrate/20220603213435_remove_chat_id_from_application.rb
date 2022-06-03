class RemoveChatIdFromApplication < ActiveRecord::Migration[7.0]
  def change
    remove_column :applications, :chat_id, :integer
  end
end
