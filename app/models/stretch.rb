# == Schema Information
#
# Table name: stretches
#
#  id           :integer          not null, primary key
#  stretch_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  body_part_id :integer
#
class Stretch < ApplicationRecord
  belongs_to(:body_part, { :required => true, :class_name => "BodyPart", :foreign_key => "body_part_id" })
end
