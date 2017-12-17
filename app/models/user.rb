class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null 

  has_many :sent_messages,
           class_name: "Message",
           foreign_key: "sender_id",
           dependent: :destroy

  has_many :received_messages,
           class_name: "Message",
           foreign_key: "recipient_id",
           dependent: :destroy

  validates_presence_of :email,
                        :name,
                        :encrypted_password
end
