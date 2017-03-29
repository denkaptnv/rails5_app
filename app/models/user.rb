class User < ApplicationRecord

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
    user.uid = auth_hash['uid']
    user.provider = auth_hash['provider']
    user.name = auth_hash['info']['name']
    user.image = auth_hash['info']['image']
    user.save!
    user
  end

  has_many :properties

end
