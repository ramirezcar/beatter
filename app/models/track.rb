# == Schema Information
#
# Table name: tracks
#
#  id           :integer          not null, primary key
#  audio_file   :string
#  bpm          :integer
#  img_url      :string
#  tagged_audio :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_tracks_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Track < ApplicationRecord
    validates_presence_of :title, :bpm#, :img_url#, :basic_licence_id, :standard_licence_id, :premium_licence_id

    has_one_attached :img_url
    has_one_attached :tagged_audio

    belongs_to :user
    
    # has_many :comments, dependent: :delete_all
    has_many :likes, dependent: :delete_all
    has_many :licences, dependent: :delete_all

    # before_validation :release_date_cannot_be_in_the_past, :on => :update

    # def release_date_cannot_be_in_the_past
    #     if release_date.present? && release_date < Date.today
    #     errors.add(:release_date, "debe ser mayor a hoy")
    #     puts errors
    #     end
    # end    

    def self.feed(me_id)
        tracks = []
        followed_users = User.get_followed_users(me_id)
        followed_users.push(me_id)
        followed_users.each do |f_user|
            user_tracks = Track.where(user_id: f_user)
            user_tracks.each do |track|
                tracks.push(track)
            end
        end
        return tracks
    end

    def basic_licence
        licence = Licence.where(track_id: self.id, licence_name_id: 1).last
    end

    def exclusive_licence
        licence = Licence.where(track_id: self.id, licence_name_id: 2).last
    end
end
