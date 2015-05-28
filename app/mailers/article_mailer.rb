# Mailer used by ActionMailer
class ArticleMailer < ActionMailer::Base
  def email_last_art(user_email, total_articles)
    @articles = total_articles
    mail subject: "Here's what you missed!",
         to:       user_email,
         from:     Rails.application.secrets.credentials_user
  end

  # q means "quantity" (q_articles_per_user)
  def email_last_users_art(user_email, total_users, q_articles_per_user)
    @users = total_users
    @articles_per_user = q_articles_per_user
    mail subject:  "Check who's new @ the blog!",
         to:       user_email,
         from:     Rails.application.secrets.credentials_user
  end
end
