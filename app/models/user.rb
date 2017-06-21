class User < ApplicationRecord

  has_attached_file :avatar , styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                    :url => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/user/:id/:style/:basename.:extension"
  validates_attachment_presence :photo
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']

  
  # For image to show add image_tag @user.photo.url
  # To display image size pass medium: or thumb: as a paramater to url method EX: @user.photo.url(:thumb)

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  has_many :events
  has_secure_password

  # has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100>" }, default_url: "/image/:style/missing.png"
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.create_with_omniauth(auth)
      create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["info"]["name"]
      end
    end



end
