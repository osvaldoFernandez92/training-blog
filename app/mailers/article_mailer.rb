class ArticleMailer < ActionMailer::Base

  def email_last_articles(user,total_articles)
  	@articles=Article.last_created(total_articles)
    mail :subject => "Here's what you missed!",
         :to      => user.email,
         :from    => Rails.application.secrets.credentials_user
  end

  def email_last_users_articles(user_email,total_users,total_articles_per_user)
  	@users=User.last_created(total_users)
    @articles_per_user=total_articles_per_user
    mail :subject => "Check who's new @ the blog!",
         :to      => user_email,
         :from    => Rails.application.secrets.credentials_user
  end


end