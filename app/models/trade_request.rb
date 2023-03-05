# == Schema Information
#
# Table name: trade_requests
#
#  id           :integer          not null, primary key
#  body         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  apartment_id :integer
#  recipient_id :integer
#  sender_id    :integer
#
class TradeRequest < ApplicationRecord

  belongs_to(:apartment, {
    :class_name => "Apartment",
    :foreign_key => "apartment_id",
    :required => true
  })

  belongs_to(:sent_trade_requests, {
    :class_name => "User",
    :foreign_key => "sender_id",
    :required => true
  })

  belongs_to(:received_trade_requests, {
    :class_name => "User",
    :foreign_key => "recipient_id",
    :required => true
  })


end
