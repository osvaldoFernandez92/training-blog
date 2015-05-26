# Clase User, generada por Devise para poder loguearse en la aplicacion
class User < ActiveRecord::Base
  has_many :articles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  def self.last_created(total_users)
  	User.order(created_at: :desc).limit(total_users)
  end

  def last_created_articles(total_articles)
  	articles.order(created_at: :desc).limit(total_articles)
  end

end
