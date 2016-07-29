class Api::V1::InvitedLoisController < ApplicationController
  def index
    @invited_lois = InvitedLoi.all
    render 'index.json.jbuilder'
  end

  def show
    @invited_loi = InvitedLoi.find_by(id: params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @invited_loi = InvitedLoi.create(
      status: params[:status],
      loi_id: params[:loi_id]

    )
    Mail.new( :to => "paulyk1983@gmail.com", :from => 'colleen@svpchicago.org', :subject => 'Invitation to Request a Proposal', :body => File.read('app/views/submission_email.html.erb')).deliver!
    render 'show.json.jbuilder'
  end
end
