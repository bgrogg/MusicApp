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
end
