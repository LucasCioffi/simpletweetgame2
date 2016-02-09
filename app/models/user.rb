class User < ActiveRecord::Base
  has_many :local_participation_records
  has_many :turns

  def self.from_omniauth(auth)
    user = User.find_by(twitter_user_id: auth.uid)
    if user
      user
    else
      user = User.create(twitter_user_id: auth.uid, username: auth.info.name.to_s)
      u = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
      user.unique1 = (0...25).map{ u[rand(u.length)] }.join
      user.unique2 = (0...25).map{ u[rand(u.length)] }.join
      while User.find_by_unique1(user.unique1)#this makes sure it's unique
        user.unique1 = (0...25).map{ u[rand(u.length)] }.join
      end
      while User.find_by_unique2(user.unique2)#this makes sure it's unique
        user.unique2 = (0...25).map{ u[rand(u.length)] }.join
      end
      user.save
    end
  end
end
