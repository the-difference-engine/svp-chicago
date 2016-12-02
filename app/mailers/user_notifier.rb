class UserNotifier < ActionMailer::Base
  default :from => 'no_reply@svpchicago.org'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_notification(user)
    @user = user
    p user
    mail( :to => @user.email,
    :subject => 'Thanks for submission to SVP!' )
  end

  def send_loi_rejection(user)
    @user = user
    mail( :to => @user.email,
          :cc => 'colleen@svpchicago.org',
          :subject => 'Thanks for submission to SVP!' )
  end

  def send_notification_admin(admin)
    @admin = admin
    p admin
    mail( :to => @admin.email,
    :subject => 'An LOI has been submitted!' )
  end

  def send_rfp_notification(user)
    @user = user
    p user
    mail( :to => @user.email,
    :subject => 'Thanks for submitting an RFP to SVP!' )
  end

  def send_rfp_notification_admin(admin)
    @admin = admin
    p admin
    mail( :to => @admin.email,
    :subject => 'An RFP has been submitted!' )
  end

  def send_rfp_acceptance(user)
    @user = user
    p user
    mail( :to => @user.email,
          :cc => 'colleen@svpchicago.org',
          :subject => "You're invited to submit an RFP!" )
  end
end