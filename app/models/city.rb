# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  city_name  :text
#  city_state :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class City < ApplicationRecord
end
