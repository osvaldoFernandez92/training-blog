class HardWorker
  include Sidekiq::Worker

  def perform(current_user_email, total_users, total_articles)
    puts 'Doing hard work'
    puts current_user_email
    ArticleMailer.email_last_users_articles(current_user_email,5,10).deliver
  end
end