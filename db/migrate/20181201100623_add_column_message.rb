class AddColumnMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :sender_id , :integer
    add_column :messages, :reciever_id , :integer
  end
end
