class EmailsController < ApplicationController
  # has_one :invited_lois
  def index
    @lois = Loi.where(submitted: true).where(reject: nil)  
  end

  def send_rejection_emails
    @lois = Loi.where(submitted: true).where(reject: nil)

    @lois.each do |loi|
      if loi.invited_lois.empty?
        InvitedLoi.create(loi_id: loi.id, status: false)
        UserNotifier.send_loi_rejection(loi.user).deliver
      end
    end
    redirect_to "/emails"
  end
end
