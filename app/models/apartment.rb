# == Schema Information
#
# Table name: apartments
#
#  id                :integer          not null, primary key
#  area              :text
#  availability      :boolean
#  bathrooms         :integer
#  bedrooms          :integer
#  description       :text
#  from_date         :date
#  image             :string
#  negotiable        :boolean
#  parking_available :boolean
#  price             :integer
#  to_date           :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  city_id           :integer
#  owner_id          :integer
#
class Apartment < ApplicationRecord

  belongs_to(:city, {
    :class_name => "City",
    :foreign_key => "city_id",
    :required => true
  })

  belongs_to(:owner, {
    :class_name => "User",
    :foreign_key => "owner_id",
    :required => true
  })

end
