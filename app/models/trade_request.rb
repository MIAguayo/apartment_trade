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
end
