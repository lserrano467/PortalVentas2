class User < ActiveRecord::Base
  has_secure_password

##El usuario antes de ser guardado debe de cumplir con estos requisitos
  validates :userName, uniqueness: true
  validates :email, uniqueness: true
            #format: {
             # with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
            #}
  validates :phone, uniqueness: true
  
  #Asociaciones
  has_many :features
  has_many :comments
  has_many :notifications

  #like para el articulo
  make_flagger

  #REgistra el usuario de facebook por si no esta creado
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider 
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.lastName = auth.info.last_name
      user.email    = auth.info.email
      user.userName = auth.info.username
      user.userType = 'Usuario'
      user.password = auth.info.name
      user.save!
    end
  end
end
