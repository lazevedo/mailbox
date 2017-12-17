class Message < ApplicationRecord
  belongs_to :sender,
             class_name: "User",
             primary_key: "sender_id"

  belongs_to :recipient, 
             class_name: "User",
             primary_key: "recipient_id"

 validates_presence_of :title,
                       :body,
                       :sender_id,
                       :recipient_id,
                       :is_read,
                       :is_archived
end
