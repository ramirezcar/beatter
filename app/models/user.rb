# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  aka                    :string
#  avatar                 :string
#  desc                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  include Rails.application.routes.url_helpers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validate :aka_is_valid
  
  has_many :posts, dependent: :delete_all
  has_many :tracks, dependent: :delete_all
  # has_many :tracks, dependent: :destroy
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :follows, foreign_key: "follower_id", class_name: "Follow", dependent: :destroy
  has_many :followeds, foreign_key: "followed_id", class_name: "Follow", dependent: :destroy
  
  has_many :notifications, foreign_key: :recipient_id, dependent: :delete_all
  
  has_one_attached :avatar
  
  # def aka_is_valid
  #   if aka.length > 20
  #     errors.add(:aka, "El nombre supera el maximo.")
  #   end
  # end
         
  # validate :avatar_format

  # def resize_image
  #   # resized_image = MiniMagick::Image.read(avatar)
  #   resized_image = MiniMagick::Image.new(rails_blob_path(avatar, disposition: "attachment", only_path: true))
  #   # resized_image = MiniMagick::Image.read(rails_blob_path(avatar, disposition: "attachment", only_path: true))
  #   resized_image = resized_image.resize "400X400"
  #   v_filename = avatar.filename
  #   v_content_type = avatar.content_type
  #   avatar.purge
  #   avatar.attach(io: File.open(resized_image.path), filename:  v_filename, content_type: v_content_type)
  # end

  # private
  # def avatar_format
  #   return unless avatar.attached?
  #   if avatar.blob.content_type.start_with? 'image/'
  #     if avatar.blob.byte_size > 10.megabytes
  #       errors.add(:avatar, 'size needs to be less than 10MB')
  #       avatar.purge
  #     else
  #       resize_image
  #     end
  #   else
  #     avatar.purge
  #     errors.add(:avatar, 'needs to be an image')
  #   end
  # end

  def is_followed_by_current(current)
    if current
      Follow.is_followed(current, id)
    end
  end

  def self.get_followers_count(user)
    Follow.where(followed_id: user.id).count
  end
  
  def self.get_followed_count(user)
    Follow.where(follower_id: user.id).count
  end

  def self.get_followed_users(user)
    follows = Follow.get_user_followed(user)
    users = []
    follows.each do |follow|
      users.push(follow.followed_id)
    end
    return users
  end
  
  def self.get_followed(user)
    Follow.where(follower_id: user.id)
  end

end
