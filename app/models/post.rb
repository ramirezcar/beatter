# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :string
#  img_file   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Post < ApplicationRecord
    # validates_presence_of :user_id
    # validates_presence_of :img_url
    # validates :img_url, uniqueness: true, on: :create

    has_one_attached :img_file

    belongs_to :user
    
    has_many :comments, dependent: :delete_all
    has_many :likes, dependent: :delete_all

    def self.feed(me_id)
        posts = []
        followed_users = User.get_followed_users(me_id)
        followed_users.push(me_id)
        followed_users.each do |f_user|
            user_posts =  Post.where(user_id: f_user)
            user_posts.each do |post|
                posts.push(post) if post.present?
            end
        end
        return posts
    end

    
    def comments
        comments = Comment.get_post_comments(self.id)
    end

    def liked(me)
        unless me.blank?
            liked = Like.is_liked(me.id, self.id)
        end
    end

    
    def get_likes_count
        likes = Like.where(post_id: self.id).count
    end

end
