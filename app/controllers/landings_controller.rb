class LandingsController < ApplicationController
  def home
    @landing = Landing.find_by(id: 1)
  end

  def edit
    @landing = Landing.find_by(id: 1)
  end

  def update
    @landing = Landing.find_by(id: 1)
    @landing.update(
      year: params[:year],
      sector_focus: params[:sector_focus],
      main_points: params[:main_points],
      gray_section: params[:gray_section],
      last_point: params[:last_point]
      )
    redirect_to '/home'
  end

  def thanks
    @loi = Loi.find(params[:id]) 

    if @loi.submitted

        company_name = @loi.answers.find_by(question_id:1).answer
        super_admin = User.where(super_admin: true).first

        # CREATE LOI SUBMISSION CONFIRMATION EMAIL
        File.open('app/views/submission_email.html.erb', 'w') { |file| file.write(
        "<p>SVP Chicago has received your submission!</p>
        <p>Please log in at <a target='_blank' href='#{request.base_url}'>#{request.base_url}</a> and review your submission</p>
        <p>If revisions to your letter of interest form need to be made or if you have any questions, please email Colleen at colleen@svpchicago.org</p>
        <p>Social Venture Partners - Chicago</p>"
        ) }

        # SEND LOI SUBMISSION CONFIRMATION EMAIL TO USER
        Mail.new( 
          :to => @loi.email, 
          :from => 'colleen@svpchicago.org', 
          :subject => 'Submission to SVP received', 
          :body => File.read('app/views/submission_email.html.erb'),
          :content_type => 'text/html; charset=UTF-8'
        ).deliver!

        # CREATE ADMIN ALERT EMAIL TEMPLATE
        File.open('app/views/loi_submitted_email_to_admin.html.erb', 'w') { |file| file.write(
        "<p>A user from <i>#{@loi.org_name}</i> has submitted a letter of interest.</p>
        <p>Click below to log in and review their LOI:</p>
        <p><a target='_blank' href='#{request.base_url}'>#{request.base_url}</a></p>"
        ) }

        # SEND LOI SUBMISSION ALERT EMAIL TO ADMIN
        Mail.new( 
          :to => super_admin.email,
          :from => 'svptesting1871@gmail.com', 
          :subject => 'A letter of interest has been submitted', 
          :body => File.read('app/views/loi_submitted_email_to_admin.html.erb'),
          :content_type => 'text/html; charset=UTF-8'
        ).deliver!        
      end
  end
end
