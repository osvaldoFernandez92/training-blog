# Clase articulo. Tiene muchos comentarios.
# dependent: :destroy significa que los elimina si eliminamos articulos
# validar que exista el titulo y que sea de 5 char minimo
class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }

  def self.ten_last_created
  	Article.order(:created_at ).limit(10)
  end
end
