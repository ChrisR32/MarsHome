class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates_presence_of :context, :conversation_id, :user_id
  after_create_commit :create_notification

  def message_time
    self.created_at.strftime("%v")
    self.created_at
  end

  private
  def create_notification
    # if self.conversation.sender_id == self.user_id
    #  sender = User.find(self.conversation.sender_id)
    #  Notification.create(context: "New message from #{sender.first_name}", user_id: self.conversation.recipient_id)
    # else
    #  sender = User.find(self.conversation.recipient_id)
    #  Notification.create(context: "New message from #{sender.first_name}", user_id: self.conversation.sender_id)
    # end
end
end
