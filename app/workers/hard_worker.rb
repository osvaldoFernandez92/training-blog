# Hardworker class
class HardWorker
  include Sidekiq::Worker

  # q_ means quantity (q_users and q_articles)
  def perform(user_email, q_users, q_articles)
    @users = User.last_created(q_users)
    ArticleMailer.email_last_users_art(user_email, @users, q_articles).deliver!
  end
end
