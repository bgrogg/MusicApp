# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  ord        :integer          not null
#  bonus      :boolean          default("false"), not null
#  lyrics     :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album

  has_one :band,
    through: :album,
    source: :band

  validates :album, :lyrics, :name, :ord, presence: true
  validates :bonus, inclusion: { in: [true, false] }
  validates :ord, uniqueness: { scope: :album_id }
end
