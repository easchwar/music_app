# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  album_id   :integer          not null
#  lyrics     :text
#  track_type :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :title, :album_id, :track_type, presence: true
  belongs_to :album

  has_one :band, through: :album, source: :band
end
