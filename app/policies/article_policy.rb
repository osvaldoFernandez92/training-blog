# Pundit Article policy
class ArticlePolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def update?
    user.eql? article.user
  end
end
