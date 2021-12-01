# == Schema Information
#
# Table name: follows
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followed_id :integer
#  follower_id :integer
#
# Indexes
#
#  index_follows_on_followed_id  (followed_id)
#  index_follows_on_follower_id  (follower_id)
#
# Foreign Keys
#
#  followed_id  (followed_id => users.id)
#  follower_id  (follower_id => users.id)
#
class Follow < ApplicationRecord
    validates_presence_of :followed_id, :follower_id
    # belongs_to :user
    before_validation :can_follow, :on => :create

    private
    def can_follow
        if is_followed
            errors.add(:followed_id, "Ya has seguido a este artista.")
        end
    end

    def self.get_follow(me, other)
        follow = Follow.where(follower_id: me, followed_id: other).first
    end

    private
    def is_followed
        is_follows = Follow.where(follower_id: follower_id, followed_id: followed_id).exists?
    end
    
    def self.is_followed(me, other)
        is_follows = Follow.where(follower_id: me, followed_id: other).exists?
    end
    
    def self.get_user_followers(user)
        u_follows = Follow.where(followed_id: user)
    end
    
    def self.get_user_followed(user)
        u_follows = Follow.where(follower_id: user)
    end
    
    # def self.get_followers(user)
    #     @u_follows = Follow.where(followed_id: user.id)
    #     followers = []
    #     @u_follows.each do |follow|
    #         followers.push(User.find(follow.follower_id))
    #     end
    #     return followers
    # end

    # def self.get_followed(user)
    #     @u_follows = Follow.where(follower_id: user.id)
    #     followed = []
    #     @u_follows.each do |follow|
    #         followed.push(User.find(follow.followed_id))
    #     end
    #     return followed
    # end
end
