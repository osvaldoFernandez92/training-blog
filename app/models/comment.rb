# Clase comment. Pertenece a un articulo
class Comment < ActiveRecord::Base
  belongs_to :article
end
