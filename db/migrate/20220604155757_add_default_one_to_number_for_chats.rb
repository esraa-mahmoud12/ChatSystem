class AddDefaultOneToNumberForChats < ActiveRecord::Migration[7.0]
  def change
    change_column_default :chats, :number, from: nil, to: 1
  end
end
