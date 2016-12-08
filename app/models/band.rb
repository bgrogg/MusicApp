# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Band < ActiveRecord::Base

  has_many :albums,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Album,
    dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
