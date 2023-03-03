# == Schema Information
#
# Table name: body_parts
#
#  id             :integer          not null, primary key
#  body_part_name :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class BodyPart < ApplicationRecord
  has_many(:users, { :class_name => "UserBodyPart", :foreign_key => "body_part_id", :dependent => :destroy })
  has_many(:stretches, { :class_name => "Stretch", :foreign_key => "body_part_id", :dependent => :destroy })
  has_many(:userss, { :through => :users, :source => :user })
end
