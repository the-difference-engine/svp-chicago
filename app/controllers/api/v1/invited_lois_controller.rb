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

    #CREATE LOI ACCEPTANCE EMAIL TEMPLATE
    File.open('app/views/loi_acceptance_email.html.erb', 'w') { |file| file.write(
        "<p><p>Hello, #{@invited_loi.loi.name}, and Congratulations! You have been invited to fill out a <a href='https://demo-svp-chicago.herokuapp.com/rfps/new'>Request For Proposal</a> form.</p>
          <p>To get started, log in to your account here: <a href='https://demo-svp-chicago.herokuapp.com'>https://demo-svp-chicago.herokuapp.com</a> and click on the RFP form button.</p>"
        ) }

    Mail.new( 
      :to => @invited_loi.loi.email, 
      :from => 'colleen@svpchicago.org', 
      :subject => 'Invitation to Request a Proposal', 
      :body => File.read('app/views/loi_acceptance_email.html.erb'),
      :content_type => 'text/html; charset=UTF-8'
    ).deliver!
    render 'show.json.jbuilder'
  end
end
