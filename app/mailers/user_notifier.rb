class UserNotifier < ActionMailer::Base
  default :from => 'no_reply@svpchicago.org'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_notification(user)
    @user = user
    p "*** **** *****"
    p user
    mail( :to => @user.email,
    :subject => 'Thanks for submitting your SVP !' )
  end

  def send_notification_admin(admin)
    @admin = admin
    p admin
    mail( :to => @admin.email,
    :subject => 'An SVP has been submitted!' )
  end

end