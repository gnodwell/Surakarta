class User < ApplicationRecord
    has_many :messagee, foreign_key: :receiver_id, class_name: 'Message'  
    has_many :senders, through: :messagee
    has_many :messaged, foreign_key: :sender_id, class_name: 'Message'
    has_many :receivers, through: :messaged
end