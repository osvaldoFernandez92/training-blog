class ArticleMailer < ActionMailer::Base

  def email_name(user)
  	@articles=Article.ten_last_created
    mail :subject => "Mandrill rides the Rails!",
         :to      => user.email,
         :from    => Rails.application.secrets.credentials_user
  end 
end