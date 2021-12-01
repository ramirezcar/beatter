# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  track_id   :integer
#  user_id    :integer          not null
#
# Indexes
#
#  index_likes_on_post_id   (post_id)
#  index_likes_on_track_id  (track_id)
#  index_likes_on_user_id   (user_id)
#
# Foreign Keys
#
#  post_id   (post_id => posts.id)
#  track_id  (track_id => tracks.id)
#  user_id   (user_id => users.id)
#
class Like < ApplicationRecord

    belongs_to :post
    belongs_to :user

    before_validation :can_like, :on => :create

    def can_like
        if is_liked
            errors.add(:post_id, "Ya has likeado este post.")
        end
    end

    # def self.get_like(me, post)
    #     follow = Follow.where(follower_id: me, followed_id: other).first
    # end

    private
    def is_liked
        @like = Like.where(user_id: self.user_id, post_id: self.post_id)
        is_liked = @like.exists?
    end
    
    def self.is_liked(me, post)
        like = Like.where(user_id: me, post_id: post)
        is_liked = like.exists?
    end
    
    # def self.get_user_likes_made(user)
    #     u_likes = Like.where(user_id: user)
    # end
end
