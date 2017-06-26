class User < ApplicationRecord

  has_attached_file :avatar , styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                    :url => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/user/:id/:style/:basename.:extension"
  # validates_attachment_presence :photo
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

  def username
    self.email.split("@")[0]
  end

  has_many :events
  has_secure_password

  # has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100>" }, default_url: "/image/:style/missing.png"
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.refresh_token = auth.credentials.token
      user.access_token = auth.fetch_access_token!
      user.name = auth["info"]["name"]
    end
  end

  def get_google_calendars
    url = "https://www.googleapis.com/plus/v1/people/#{self.uid}/people/visible?access_token=945481249376-iol50o9lmh8go43pna2s34bplm67s4ke.apps.googleusercontent.com&client_id=NraFdsjzAHKiwC9R2iyaCrBR"
    # url = "https://www.googleapis.com/calendar/v3/users/#{self.uid}/calendarList?access_token=945481249376-iol50o9lmh8go43pna2s34bplm67s4ke.apps.googleusercontent.com&client_id=NraFdsjzAHKiwC9R2iyaCrBR"
    response = HTTParty.get(url)
    puts "======== #{url}"
    # json = JSON.parse(response.read)
    puts response
    # calendars = json["items"]
    # calendars.each { |cal| get_events_for_calendar(cal) }
  end

  def get_events_for_calendar(cal)

    url = "https://www.googleapis.com/calendar/v3/calendars/#{cal["id"]}/events?access_token=595114268591-20munkhdk885gekiicrsi63vq2bhcdff.apps.googleusercontent.com"
    response = open(url)
    json = JSON.parse(response.read)
    my_events = json["items"]

    my_events.each do |event|
      name = event["summary"] || "no name"
      creator = event["creator"] ? event["creator"]["email"] : nil
      start = event["start"] ? event["start"]["dateTime"] : nil
      status = event["status"] || nil
      link = event["htmlLink"] || nil
      calendar = cal["summary"] || nil

      events.create(name: name,
                    creator: creator,
                    status: status,
                    start: start,
                    link: link,
                    calendar: calendar
                    )
    end
  end
end
