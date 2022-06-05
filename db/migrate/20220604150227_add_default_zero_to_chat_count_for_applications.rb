class AddDefaultZeroToChatCountForApplications < ActiveRecord::Migration[7.0]
  def change
    change_column_default :applications, :chat_count, from: nil, to: 0
  end
end
