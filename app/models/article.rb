# Clase articulo. Tiene muchos comentarios.
# dependent: :destroy significa que los elimina si eliminamos articulos
# validar que exista el titulo y que sea de 5 char minimo
class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }

  def self.last_created(total_articles)
    Article.order(created_at: :desc).limit(total_articles)
  end
end
