# Clase User, generada por Devise para poder loguearse en la aplicacion
class User < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  def self.last_created(total_users)
    User.order(created_at: :desc).limit(total_users)
  end

  def last_created_articles(total_articles)
    articles.order(created_at: :desc).limit(total_articles)
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
        email: data['email'],
        password: Devise.friendly_token[0, 20])
    end
    user
  end
end
