class UserMailer < ActionMailer::Base
  default from: 'welcome@rantly.com'
  def send_welcome(user, full_url)
    @user = user
    @url = full_url
    mail(to: @user.email, subject: "THis is the subj line")
  end

end