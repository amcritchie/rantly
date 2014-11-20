class UserMailer < ActionMailer::Base
  default from: 'welcome@rantly.com'
  def send_welcome(user, full_url)
    @user = user
    @url = full_url
    mail(to: @user.email, subject: "Rant.ly Confirmation")
  end

  def notify_of_rant(user, ranter, rant)
    @user = user
    @ranter = ranter
    @rant = rant
    mail(to: @user.email, subject: "Your friend  just ranted")
  end

end