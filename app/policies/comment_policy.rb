# Pundit CommentPolicy
class CommentPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def destroy?
    user.eql? comment.article.user
  end
end
